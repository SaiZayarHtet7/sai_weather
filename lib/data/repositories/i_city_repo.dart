import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:sai_weather/core/core.dart';
import 'package:sai_weather/core/utils/method_utils.dart';
import 'package:sai_weather/data/data.dart';

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

      //storing data in floor

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
      {required CityModel cityModel}) async {
    try {
      //declaration of database
      final database = await $FloorOffWeatherDatabase
          .databaseBuilder('off_weather.db')
          .build();
      final offWeatherDao = database.offWeatherDao;

      ///checking online offline ;
      ///
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        "start of online mode ".log();

        ///
        final data = await Api().myDio.get(MethodUtils.forecastUrlOne +
            cityModel.name +
            MethodUtils.forecastUrlTwo);

        // data.data.toString().log(title: "response from data");
        ForecastResponseModel forecastResponseModel =
            ForecastResponseModel.fromJson(data.data);

        //create model for inserting data;
        OffWeatherDetailModel offWeatherDetailModel = OffWeatherDetailModel(
            cityId: cityModel.id,
            dateTime: DateTime.now().toString().formattedDate,
            weatherJson: jsonEncode(data.data).toString());

        await offWeatherDao
            .insertOffWeatherDetailModel(offWeatherDetailModel)
            .then((value) => "inserted for offline mode".log());

        return Right(forecastResponseModel);
      } else {
        ///offline mode
        "start of online mode ".log();

        ///
        ///get offline data
        List<OffWeatherDetailModel> offWeatherDetailList =
            await offWeatherDao.getWeatherDetailById(cityModel.id);

        ///check data is containing
        if (offWeatherDetailList.isEmpty) {
          return Left(ConnectionFailure());
        }

        OffWeatherDetailModel offlineData = offWeatherDetailList.first;

        String encodeJson = offlineData.weatherJson;
        dynamic jsonData = json.decode(encodeJson);

        ForecastResponseModel forecastResponseModel =
            ForecastResponseModel.fromJson(jsonData);

        return Right(forecastResponseModel);
      }
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

  String removeJsonAndArray(String text) {
    if (text.startsWith('[') || text.startsWith('{')) {
      text = text.substring(1, text.length - 1);
      if (text.startsWith('[') || text.startsWith('{')) {
        text = removeJsonAndArray(text);
      }
    }
    return text;
  }
}
