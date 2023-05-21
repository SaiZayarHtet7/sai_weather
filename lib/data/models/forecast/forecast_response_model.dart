import 'package:sai_weather/data/models/weather/condition_model.dart';
import 'package:sai_weather/data/models/forecast/fc_model.dart';
import 'package:sai_weather/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

import '../weather/current_weather_model.dart';

part 'forecast_response_model.g.dart';

@JsonSerializable()
class ForecastResponseModel implements ForecastResponse {
  @override
  @JsonKey(name: "current")
  final WeatherModel? current;

  @override
  @JsonKey(name: "forecast")
  final ForecastModel? forecast;

  factory ForecastResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastResponseModelFromJson(json);

  ForecastResponseModel(this.current, this.forecast);

  Map<String, dynamic> toJson() => _$ForecastResponseModelToJson(this);
}
