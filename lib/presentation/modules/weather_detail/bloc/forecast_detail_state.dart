part of 'forecast_detail_bloc.dart';

abstract class ForecastDetailState extends Equatable {
  const ForecastDetailState();

  @override
  List<Object> get props => [];
}

class ForecastDetailInitial extends ForecastDetailState {}

class ForecastDetailData extends ForecastDetailState {
  final ForecastResponseModel forecastResponseModel;

  const ForecastDetailData(this.forecastResponseModel);
}

class ForecastDetailLoading extends ForecastDetailState {}

class ForecastDetailError extends ForecastDetailState {
  final String error;

  const ForecastDetailError(this.error);
}
