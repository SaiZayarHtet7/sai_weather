// "maxtemp_c": 40.7,
// "maxtemp_f": 105.3,
// "mintemp_c": 27.4,
// "mintemp_f": 81.3,
// "avgtemp_c": 32.5,
// "avgtemp_f": 90.5,
// "maxwind_mph": 14.3,
// "maxwind_kph": 23.0,
// "totalprecip_mm": 0.0,
// "totalprecip_in": 0.0,
// "totalsnow_cm": 0.0,
// "avgvis_km": 10.0,
// "avgvis_miles": 6.0,
// "avghumidity": 57.0,
// "daily_will_it_rain": 0,
// "daily_chance_of_rain": 0,
// "daily_will_it_snow": 0,
// "daily_chance_of_snow": 0,
// "condition": {
//     "text": "Sunny",
//     "icon": "//cdn.weatherapi.com/weather/64x64/day/113.png",
//     "code": 1000
// },
// "uv": 8.0

import 'package:sai_weather/data/data.dart';

abstract class EachDay {
  final double? minTemp, maxTemp;
  final ConditionModel? condition;

  EachDay(this.minTemp, this.maxTemp, this.condition);
}
