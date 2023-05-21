// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastResponseModel _$ForecastResponseModelFromJson(
        Map<String, dynamic> json) =>
    ForecastResponseModel(
      json['current'] == null
          ? null
          : WeatherModel.fromJson(json['current'] as Map<String, dynamic>),
      json['forecast'] == null
          ? null
          : ForecastModel.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ForecastResponseModelToJson(
        ForecastResponseModel instance) =>
    <String, dynamic>{
      'current': instance.current,
      'forecast': instance.forecast,
    };
