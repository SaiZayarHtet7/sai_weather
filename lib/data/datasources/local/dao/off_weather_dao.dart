import 'package:floor/floor.dart';

import '../../../data.dart';

@dao
abstract class OffWeatherDao {
  @Query('SELECT * FROM OffWeatherDetailModel WHERE id = :id')
  Future<List<OffWeatherDetailModel>> getWeatherDetailById(int id);

  @insert
  Future<void> insertOffWeatherDetailModel(
      OffWeatherDetailModel offWeatherDetailModel);
}
