import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:news_api/news_api.dart';

class ArticlesRequestFailure implements Exception {}

class HeadlinesRequestFailure implements Exception {}

class HeadlinesNotFoundFailure implements Exception {}

class SourcesRequestFailure implements Exception {}

class NewsApiClient {
  NewsApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  var logger = Logger();

  static const Map<String, String> httpHeader = {
    'X-Api-Key': '9eb6b57ccd61479cbe15bb53ee91b403'
  };
  static const String _baseUrl = 'newsapi.org';

  final http.Client _httpClient;

  Future<Articles> getArticles(Map<String, String> params) async {
    final articlesRequest = Uri.https(_baseUrl, '/everything', params);

    final articlesResponse =
        await _httpClient.get(articlesRequest, headers: httpHeader);

    if (articlesResponse.statusCode != 200) throw ArticlesRequestFailure();

    final articelsJson = jsonDecode(articlesResponse.body) as Map;

    return Articles.fromJson(articelsJson as Map<String, dynamic>);
  }

  Future<Headlines> getHeadlines(Map<String, String> params) async {
    Uri headlinesRequest = Uri.https('google.com');
    try {
      headlinesRequest = Uri.https(_baseUrl, '/v2/top-headlines', params);
    } catch (e) {
      logger.e(e);
    }

    logger.i(
        'Getting headlines in API Client with params: $params. Request: $headlinesRequest');

    final headlinesResponse =
        await _httpClient.get(headlinesRequest, headers: httpHeader);

    if (headlinesResponse.statusCode != 200) throw HeadlinesRequestFailure();

    final headlinesJson = jsonDecode(headlinesResponse.body) as Map;

    try {
      return Headlines.fromJson(headlinesJson as Map<String, dynamic>);
    } catch (e) {
      logger.w(e);
      return const Headlines(status: 'Failure', totalResults: 0, articles: []);
    }
  }

  Future<Sources> getSources(Map<String, String> params) async {
    final sourcesRequest =
        Uri.https(_baseUrl, '/top-headlines/sources', params);

    final sourcesResponse =
        await _httpClient.get(sourcesRequest, headers: httpHeader);

    if (sourcesResponse.statusCode != 200) throw SourcesRequestFailure();

    final sourcesJson = jsonDecode(sourcesResponse.body) as Map;

    return Sources.fromJson(sourcesJson as Map<String, dynamic>);
  }
}
