part of 'search_city_bloc.dart';

abstract class SearchCityState extends Equatable {
  const SearchCityState();

  @override
  List<Object> get props => [];
}

class SearchCityInitial extends SearchCityState {}

class SearchCityNoData extends SearchCityState {}

class SearchCityLoading extends SearchCityState {}

class SearchCityWarning extends SearchCityState {}

class SearchCityError extends SearchCityState {
  final String error;

  const SearchCityError({required this.error});
}

class SearchCityData extends SearchCityState {
  final List<CityModel> cityList;

  const SearchCityData(this.cityList);
}
