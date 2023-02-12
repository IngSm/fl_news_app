// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'articles.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtSource _$ArtSourceFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ArtSource',
      json,
      ($checkedConvert) {
        final val = ArtSource(
          id: $checkedConvert('id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Article _$ArticleFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Article',
      json,
      ($checkedConvert) {
        final val = Article(
          source: $checkedConvert(
              'source',
              (v) => v == null
                  ? null
                  : ArtSource.fromJson(v as Map<String, dynamic>)),
          author: $checkedConvert('author', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          url: $checkedConvert('url', (v) => v as String?),
          urlToImage: $checkedConvert('url_to_image', (v) => v as String?),
          publishedAt: $checkedConvert('published_at',
              (v) => v == null ? null : DateTime.parse(v as String)),
          content: $checkedConvert('content', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'urlToImage': 'url_to_image',
        'publishedAt': 'published_at'
      },
    );

Articles _$ArticlesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Articles',
      json,
      ($checkedConvert) {
        final val = Articles(
          status: $checkedConvert('status', (v) => v as String?),
          totalResults: $checkedConvert('total_results', (v) => v as int?),
          articles: $checkedConvert(
              'articles',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'totalResults': 'total_results'},
    );
