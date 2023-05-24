abstract class OfflineWeatherDetail {
  final String weatherJson;
  final int  cityId;
  final String dateTime;

  OfflineWeatherDetail(this.weatherJson,  this.dateTime, this.cityId);
}
