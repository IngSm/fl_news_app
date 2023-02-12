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
          lastUpdate: $checkedConvert(
              'last_update', (v) => DateTime.parse(v as String)),
          articles: $checkedConvert(
              'articles',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'lastUpdate': 'last_update'},
    );

Map<String, dynamic> _$HeadlinesToJson(Headlines instance) => <String, dynamic>{
      'last_update': instance.lastUpdate.toIso8601String(),
      'articles': instance.articles?.map((e) => e.toJson()).toList(),
    };
