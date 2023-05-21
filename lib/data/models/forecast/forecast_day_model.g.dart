// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayModel _$ForecastDayModelFromJson(Map<String, dynamic> json) =>
    ForecastDayModel(
      dateEpoch: json['date_epoch'] as int? ?? 0,
      day: json['day'] == null
          ? null
          : EachDayModel.fromJson(json['day'] as Map<String, dynamic>),
      hour: (json['hour'] as List<dynamic>?)
              ?.map((e) => EachHourModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ForecastDayModelToJson(ForecastDayModel instance) =>
    <String, dynamic>{
      'date_epoch': instance.dateEpoch,
      'day': instance.day,
      'hour': instance.hour,
    };
