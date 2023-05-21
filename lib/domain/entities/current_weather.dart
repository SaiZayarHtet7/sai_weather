import '../../data/data.dart';

abstract class CurrentWeather {
  final double tempC, feelLikeC;
  final ConditionModel condition;

  CurrentWeather(this.tempC, this.feelLikeC, this.condition);
}

//  "last_updated_epoch": 1684683000,
//         "last_updated": "2023-05-21 22:00",
//         "temp_c": 30.0,
//         "temp_f": 86.0,
//         "is_day": 0,
//         "condition": {
//             "text": "Partly cloudy",
//             "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
//             "code": 1003
//         },
//         "wind_mph": 6.9,
//         "wind_kph": 11.2,
//         "wind_degree": 220,
//         "wind_dir": "SW",
//         "pressure_mb": 1009.0,
//         "pressure_in": 29.8,
//         "precip_mm": 0.0,
//         "precip_in": 0.0,
//         "humidity": 75,
//         "cloud": 50,
//         "feelslike_c": 33.0,
//         "feelslike_f": 91.4,
//         "vis_km": 6.0,
//         "vis_miles": 3.0,
//         "uv": 1.0,
//         "gust_mph": 13.6,
//         "gust_kph": 22.0