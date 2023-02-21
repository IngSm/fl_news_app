import 'dart:async';

import 'package:news_api/news_api.dart' hide Headlines, Sources;
import 'package:news_repository/news_repository.dart';

class NewsRepository {
  NewsRepository({NewsApiClient? newsApiClient})
      : _newsApiClient = newsApiClient ?? NewsApiClient();

  final NewsApiClient _newsApiClient;
  Future<Headlines> getHeadlines(Map<String, String> params) async {
    final headlines = await _newsApiClient.getHeadlines(params);

    return Headlines(
      articles: headlines.articles,
    );
  }

  Future<Sources> getSources({String country = 'us'}) async {
    Map<String, String> params = {'country': country};

    final sources = await _newsApiClient.getSources(params);

    return Sources(sources: sources.sources);
  }
}
