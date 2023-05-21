part of 'forecast_detail_bloc.dart';

abstract class ForecastDetailEvent extends Equatable {
  const ForecastDetailEvent();

  @override
  List<Object> get props => [];
}

class GetForecastDetail extends ForecastDetailEvent {
  final CityModel cityModel;

  const GetForecastDetail(this.cityModel);
}
