// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter

part of 'sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Source',
      json,
      ($checkedConvert) {
        final val = Source(
          id: $checkedConvert('id', (v) => v as String?),
          name: $checkedConvert('name', (v) => v as String?),
          description: $checkedConvert('description', (v) => v as String?),
          url: $checkedConvert('url', (v) => v as String?),
          category: $checkedConvert('category', (v) => v as String?),
          language: $checkedConvert('language', (v) => v as String?),
          country: $checkedConvert('country', (v) => v as String?),
        );
        return val;
      },
    );

Sources _$SourcesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Sources',
      json,
      ($checkedConvert) {
        final val = Sources(
          status: $checkedConvert('status', (v) => v as String?),
          sources: $checkedConvert(
              'sources',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );
