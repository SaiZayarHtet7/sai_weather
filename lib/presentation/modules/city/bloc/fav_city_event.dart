part of 'fav_city_bloc.dart';

abstract class FavCityEvent extends Equatable {
  const FavCityEvent();

  @override
  List<Object> get props => [];
}

class CheckFavCityList extends FavCityEvent {}

class AddFavCity extends FavCityEvent {
  final CityModel cityModel;

  const AddFavCity(this.cityModel);
}

class RemoveCityList extends FavCityEvent {
  final CityModel cityModel;

  const RemoveCityList(this.cityModel);
}
