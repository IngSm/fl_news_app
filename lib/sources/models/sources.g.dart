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
          lastUpdate: $checkedConvert(
              'last_update', (v) => DateTime.parse(v as String)),
          sources: $checkedConvert(
              'sources',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {'lastUpdate': 'last_update'},
    );

Map<String, dynamic> _$SourcesToJson(Sources instance) => <String, dynamic>{
      'last_update': instance.lastUpdate.toIso8601String(),
      'sources': instance.sources?.map((e) => e.toJson()).toList(),
    };
