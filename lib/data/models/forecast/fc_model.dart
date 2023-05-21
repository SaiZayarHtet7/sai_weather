import 'package:sai_weather/data/models/forecast/forecast_day_model.dart';
import 'package:sai_weather/domain/entities/forecast/fc.dart';

import 'package:json_annotation/json_annotation.dart';

part 'fc_model.g.dart';

@JsonSerializable()
class ForecastModel implements Forecast {
  @override
  @JsonKey(name: "forecastday")
  final List<ForecastDayModel>? forecastday;

  const ForecastModel({this.forecastday});

  factory ForecastModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelToJson(this);
}
