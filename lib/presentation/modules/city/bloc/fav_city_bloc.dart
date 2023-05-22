import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sai_weather/data/data.dart';

part 'fav_city_event.dart';
part 'fav_city_state.dart';

class FavCityBloc extends Bloc<FavCityEvent, FavCityState> {
  FavCityBloc() : super(FavCityInitial()) {
    on<CheckFavCityList>((event, emit) async {
      emit(FavCityLoading());
      final database =
          await $FloorCityDatabase.databaseBuilder('city_database.db').build();
      final cityDao = database.cityDao;
      List<CityModel> cityModel = await cityDao.getAllFavCity();
      if (cityModel.isEmpty) {
        emit(FavCityNoData());
      } else {
        emit(FavCityData(cityModel));
      }
    });
  }
}
