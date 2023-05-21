import 'package:sai_weather/data/data.dart';
import 'package:sai_weather/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forecast_day_model.g.dart';

@JsonSerializable()
class ForecastDayModel implements ForecastDay {
  @override
  @JsonKey(name: "date_epoch", defaultValue: 0)
  final int? dateEpoch;

  @override
  @JsonKey(name: "day")
  final EachDayModel? day;

  @override
  @JsonKey(name: "hour", defaultValue: [])
  final List<EachHourModel>? hour;

  ForecastDayModel(
      {required this.dateEpoch, required this.day, required this.hour});

  factory ForecastDayModel.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayModelFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayModelToJson(this);
}
