import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sai_weather/core/core.dart';
import 'package:sai_weather/core/utils/method_utils.dart';
import 'package:sai_weather/data/data.dart';

import 'package:sai_weather/core/errors/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/domain.dart';

class ICityRepo implements CityRepo {
  @override
  Future<Either<Failure, List<CityModel>>> searchCity(
      {required String cityName}) async {
    try {
      final data = await Api().myDio.get(MethodUtils.cityName + cityName);

      List<CityModel> cityList =
          (data.data! as List).map((x) => CityModel.fromJson(x)).toList();
      return Right(cityList);
    } on SocketException {
      return Left(ConnectionFailure());
    } catch (e) {
      if (e.runtimeType == DioError) {
        DioError dioError = e as DioError;
        if (dioError.type == DioErrorType.connectionError ||
            dioError.type == DioErrorType.connectionTimeout ||
            dioError.type == DioErrorType.sendTimeout ||
            dioError.type == DioErrorType.receiveTimeout) {
          return Left(ConnectionFailure());
        } else {
          return Left(ServerFailure());
        }
      } else {
        return Left(LogicFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ForecastResponseModel>> getForeCast(
      {required String cityName}) async {
    try {
      final data = await Api().myDio.get(
          MethodUtils.forecastUrlOne + cityName + MethodUtils.forecastUrlTwo);

      data.data.toString().log(title: "response from data");
      ForecastResponseModel forecastResponseModel =
          ForecastResponseModel.fromJson(data.data);

      return Right(forecastResponseModel);
    } on SocketException {
      return Left(ConnectionFailure());
    } catch (e) {
      if (e.runtimeType == DioError) {
        DioError dioError = e as DioError;
        if (dioError.type == DioErrorType.connectionError ||
            dioError.type == DioErrorType.connectionTimeout ||
            dioError.type == DioErrorType.sendTimeout ||
            dioError.type == DioErrorType.receiveTimeout) {
          return Left(ConnectionFailure());
        } else {
          return Left(ServerFailure());
        }
      } else {
        return Left(LogicFailure(e.toString()));
      }
    }
  }
}
