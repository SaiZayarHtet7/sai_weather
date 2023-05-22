import 'package:floor/floor.dart';

import '../../../data.dart';

@dao
abstract class CityDao {
  @Query('SELECT * FROM CityModel')
  Future<List<CityModel>> getAllFavCity();

  @Query('SELECT * FROM CityModel WHERE id = :id')
  Future<List<CityModel>> findCityById(int id);

  @insert
  Future<void> addFavoriteCity(CityModel city);

  @Query('DELETE FROM CityModel WHERE id =:id')
  Future<void> removeFav(int id);
}
