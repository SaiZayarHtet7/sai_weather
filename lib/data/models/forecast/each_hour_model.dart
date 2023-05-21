import 'package:sai_weather/data/models/weather/condition_model.dart';
import 'package:sai_weather/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'each_hour_model.g.dart';

@JsonSerializable()
class EachHourModel implements EachHour {
  @override
  @JsonKey(name: "condition")
  final ConditionModel? condition;

  @override
  @JsonKey(name: "temp_c", defaultValue: 0)
  final double? tempC;

  @override
  @JsonKey(name: "time_epoch", defaultValue: 0)
  final int? timeEpoch;

  EachHourModel({this.condition, this.tempC, this.timeEpoch});

  factory EachHourModel.fromJson(Map<String, dynamic> json) =>
      _$EachHourModelFromJson(json);

  Map<String, dynamic> toJson() => _$EachHourModelToJson(this);
}

//  "time_epoch": 1684618200,
//                         "time": "2023-05-21 04:00",
//                         "temp_c": 27.5,
//                         "temp_f": 81.5,
//                         "is_day": 0,
//                         "condition": {
//                             "text": "Partly cloudy",
//                             "icon": "//cdn.weatherapi.com/weather/64x64/night/116.png",
//                             "code": 1003
//                         },
//                         "wind_mph": 7.2,
//                         "wind_kph": 11.5,
//                         "wind_degree": 248,
//                         "wind_dir": "WSW",
//                         "pressure_mb": 1008.0,
//                         "pressure_in": 29.75,
//                         "precip_mm": 0.0,
//                         "precip_in": 0.0,
//                         "humidity": 78,
//                         "cloud": 52,
//                         "feelslike_c": 31.0,
//                         "feelslike_f": 87.8,
//                         "windchill_c": 27.5,
//                         "windchill_f": 81.5,
//                         "heatindex_c": 31.0,
//                         "heatindex_f": 87.8,
//                         "dewpoint_c": 23.3,
//                         "dewpoint_f": 73.9,
//                         "will_it_rain": 0,
//                         "chance_of_rain": 0,
//                         "will_it_snow": 0,
//                         "chance_of_snow": 0,
//                         "vis_km": 10.0,
//                         "vis_miles": 6.0,
//                         "gust_mph": 10.1,
//                         "gust_kph": 16.2,
//                         "uv": 1.0