import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../data.dart';

part 'off_weather_db.g.dart';

@Database(version: 1, entities: [OffWeatherDetailModel])
abstract class OffWeatherDatabase extends FloorDatabase {
  OffWeatherDao get offWeatherDao;
}
