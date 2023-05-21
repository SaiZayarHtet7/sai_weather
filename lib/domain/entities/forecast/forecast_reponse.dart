import 'package:sai_weather/data/data.dart';

abstract class ForecastResponse {
  final WeatherModel? current;
  final ForecastModel? forecast;

  ForecastResponse(this.current, this.forecast);
}
