import 'package:floor/floor.dart';

import '../../../data.dart';

@dao
abstract class CityDao {
  @Query('SELECT * FROM City')
  Future<List<CityModel>> findAllPeople();

  @Query('SELECT name FROM City')
  Stream<List<String>> getAllCity();

  @Query('SELECT * FROM Person WHERE id = :id')
  Stream<CityModel?> findCityById(int id);

  @insert
  Future<void> addFavoriteCity(CityModel person);
}
