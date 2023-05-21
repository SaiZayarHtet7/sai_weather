// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModel _$WeatherModelFromJson(Map<String, dynamic> json) => WeatherModel(
      ConditionModel.fromJson(json['condition'] as Map<String, dynamic>),
      (json['feelslike_c'] as num).toDouble(),
      (json['temp_c'] as num).toDouble(),
    );

Map<String, dynamic> _$WeatherModelToJson(WeatherModel instance) =>
    <String, dynamic>{
      'condition': instance.condition,
      'feelslike_c': instance.feelLikeC,
      'temp_c': instance.tempC,
    };
