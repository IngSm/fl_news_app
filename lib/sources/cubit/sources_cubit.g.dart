// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sources_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SourcesState _$SourcesStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SourcesState',
      json,
      ($checkedConvert) {
        final val = SourcesState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$SourcesStatusEnumMap, v) ??
                  SourcesStatus.initial),
          sources: $checkedConvert(
              'sources',
              (v) => v == null
                  ? null
                  : Sources.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$SourcesStateToJson(SourcesState instance) =>
    <String, dynamic>{
      'status': _$SourcesStatusEnumMap[instance.status]!,
      'sources': instance.sources.toJson(),
    };

const _$SourcesStatusEnumMap = {
  SourcesStatus.initial: 'initial',
  SourcesStatus.loading: 'loading',
  SourcesStatus.success: 'success',
  SourcesStatus.failure: 'failure',
};
