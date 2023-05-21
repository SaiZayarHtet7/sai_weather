part of 'search_city_bloc.dart';

abstract class SearchCityEvent extends Equatable {
  const SearchCityEvent();

  @override
  List<Object> get props => [];
}

class RunSearchCity extends SearchCityEvent {
  final String cityName;

  const RunSearchCity(this.cityName);
}
