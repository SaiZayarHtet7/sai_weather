import '../../../data/data.dart';

abstract class ForecastDay {
  final int? dateEpoch;
  final EachDayModel? day;
  final List<EachHourModel>? hour;

  ForecastDay(this.dateEpoch, this.day, this.hour);
}
