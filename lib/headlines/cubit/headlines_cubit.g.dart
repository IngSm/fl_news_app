// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headlines_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadlinesState _$HeadlinesStateFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'HeadlinesState',
      json,
      ($checkedConvert) {
        final val = HeadlinesState(
          status: $checkedConvert(
              'status',
              (v) =>
                  $enumDecodeNullable(_$HeadlinesStatusEnumMap, v) ??
                  HeadlinesStatus.initial),
          headlines: $checkedConvert(
              'headlines',
              (v) => v == null
                  ? null
                  : Headlines.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Map<String, dynamic> _$HeadlinesStateToJson(HeadlinesState instance) =>
    <String, dynamic>{
      'status': _$HeadlinesStatusEnumMap[instance.status]!,
      'headlines': instance.headlines.toJson(),
    };

const _$HeadlinesStatusEnumMap = {
  HeadlinesStatus.initial: 'initial',
  HeadlinesStatus.loading: 'loading',
  HeadlinesStatus.success: 'success',
  HeadlinesStatus.failure: 'failure',
};
