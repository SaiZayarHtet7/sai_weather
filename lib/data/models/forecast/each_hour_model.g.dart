// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'each_hour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EachHourModel _$EachHourModelFromJson(Map<String, dynamic> json) =>
    EachHourModel(
      condition: json['condition'] == null
          ? null
          : ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      tempC: (json['temp_c'] as num?)?.toDouble() ?? 0,
      timeEpoch: json['time_epoch'] as int? ?? 0,
    );

Map<String, dynamic> _$EachHourModelToJson(EachHourModel instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'temp_c': instance.tempC,
      'time_epoch': instance.timeEpoch,
    };
