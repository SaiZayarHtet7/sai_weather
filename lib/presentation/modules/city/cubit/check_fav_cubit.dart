import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sai_weather/data/data.dart';

class CheckFavCubit extends Cubit<bool> {
  CheckFavCubit() : super(false);

  void checkFav({required CityModel cityModel}) async {
    //checking city is in database
    final database =
        await $FloorCityDatabase.databaseBuilder('city_database.db').build();
    final cityDao = database.cityDao;
    List<CityModel> cityModelList = await cityDao.getAllFavCity();

    var isContain = cityModelList
        .where((element) => element.id == cityModel.id)
        .toList()
        .isNotEmpty;
    if (isContain) {
      emit(true);
    } else {
      emit(false);
    }
  }

  //add city to database;

  void addFavorite({required CityModel cityModel}) async {
    final database =
        await $FloorCityDatabase.databaseBuilder('city_database.db').build();
    final cityDao = database.cityDao;
    await cityDao.addFavoriteCity(cityModel);
    emit(true);
  }

  //remove city to database;

  void removeFav({required CityModel cityModel}) async {
    final database =
        await $FloorCityDatabase.databaseBuilder('city_database.db').build();
    final cityDao = database.cityDao;
    await cityDao.removeFav(cityModel.id);
    emit(false);
  }
}
