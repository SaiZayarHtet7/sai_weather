import 'package:floor/floor.dart';
import 'package:sai_weather/domain/domain.dart';

@Entity()
class OffWeatherDetailModel implements OfflineWeatherDetail {
  @override
  String dateTime;

  @override
  @primaryKey
  int cityId;

  @override
  String weatherJson;

  OffWeatherDetailModel(
      {required this.cityId,
      required this.dateTime,
      required this.weatherJson});
}
