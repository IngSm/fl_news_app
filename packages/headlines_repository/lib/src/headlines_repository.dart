import 'dart:async';

import 'package:headlines_repository/headlines_repository.dart';
import 'package:logger/logger.dart';
import 'package:news_api/news_api.dart' hide Headlines;

class HeadlinesRepository {
  HeadlinesRepository({NewsApiClient? newsApiClient})
      : _newsApiClient = newsApiClient ?? NewsApiClient();

  final NewsApiClient _newsApiClient;
  var logger = Logger();

  Future<Headlines> getHeadlines({String country = 'us'}) async {
    // TODO: implement method to form Map with parametrs from string. Params should be separated with comma.
    Map<String, String> params = {'country': country};

    final headlines = await _newsApiClient.getHeadlines(params);

    return Headlines(
      articles: headlines.articles,
    );
  }
}
