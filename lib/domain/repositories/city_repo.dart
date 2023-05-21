import 'package:dartz/dartz.dart';
import 'package:sai_weather/core/core.dart';
import 'package:sai_weather/data/data.dart';

abstract class CityRepo {
  Future<Either<Failure, List<CityModel>>> searchCity(
      {required String cityName});

  Future<Either<Failure, ForecastResponseModel>> getForeCast(
      {required String cityName});
}
