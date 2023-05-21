import 'package:sai_weather/data/data.dart';

abstract class Forecast {
  final List<ForecastDayModel>? forecastday;

  Forecast(this.forecastday);
}
