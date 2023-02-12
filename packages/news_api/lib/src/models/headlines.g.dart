// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'headlines.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Headlines _$HeadlinesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Headlines',
      json,
      ($checkedConvert) {
        final val = Headlines(
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
