part of 'fav_city_bloc.dart';

abstract class FavCityState extends Equatable {
  const FavCityState();

  @override
  List<Object> get props => [];
}

class FavCityInitial extends FavCityState {}

class FavCityLoading extends FavCityState {}

class FavCityNoData extends FavCityState {}

class FavCityData extends FavCityState {
  final List<CityModel> cityList;

  const FavCityData(this.cityList);
}
