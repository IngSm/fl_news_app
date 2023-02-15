// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headlines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
