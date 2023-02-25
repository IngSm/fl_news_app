// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headlines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtSourceRep _$ArtSourceRepFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ArtSourceRep',
      json,
      ($checkedConvert) {
        final val = ArtSourceRep(
          id: $checkedConvert('id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
        );
        return val;
      },
    );

Map<String, dynamic> _$ArtSourceRepToJson(ArtSourceRep instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ArticleRep _$ArticleRepFromJson(Map<String, dynamic> json) => $checkedCreate(
      'ArticleRep',
      json,
      ($checkedConvert) {
        final val = ArticleRep(
          source: $checkedConvert(
              'source',
              (v) => v == null
                  ? null
                  : ArtSourceRep.fromJson(v as Map<String, dynamic>)),
          author: $checkedConvert('author', (v) => v as String?),
          title: $checkedConvert('title', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          url: $checkedConvert('url', (v) => v as String?),
          urlToImage: $checkedConvert('url_to_image', (v) => v as String?),
          publishedAt: $checkedConvert('published_at', (v) => v as String?),
          content: $checkedConvert('content', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'urlToImage': 'url_to_image',
        'publishedAt': 'published_at'
      },
    );

Map<String, dynamic> _$ArticleRepToJson(ArticleRep instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'url_to_image': instance.urlToImage,
      'published_at': instance.publishedAt,
      'content': instance.content,
    };

Headlines _$HeadlinesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Headlines',
      json,
      ($checkedConvert) {
        final val = Headlines(
          articles: $checkedConvert(
              'articles',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$HeadlinesToJson(Headlines instance) => <String, dynamic>{
      'articles': instance.articles,
    };
