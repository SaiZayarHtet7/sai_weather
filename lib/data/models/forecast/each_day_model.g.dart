// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'each_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EachDayModel _$EachDayModelFromJson(Map<String, dynamic> json) => EachDayModel(
      condition: json['condition'] == null
          ? null
          : ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      maxTemp: (json['maxtemp_c'] as num?)?.toDouble(),
      minTemp: (json['mintemp_c'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$EachDayModelToJson(EachDayModel instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'maxtemp_c': instance.maxTemp,
      'mintemp_c': instance.minTemp,
    };
