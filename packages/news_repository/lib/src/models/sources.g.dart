// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sources _$SourcesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Sources',
      json,
      ($checkedConvert) {
        final val = Sources(
          sources: $checkedConvert(
              'sources',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
    );

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'sources': instance.sources,
    };
