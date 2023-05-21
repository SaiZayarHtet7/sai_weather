import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../data.dart';

part 'city_db.g.dart';

@Database(version: 1, entities: [CityModel])
abstract class AppDatabase extends FloorDatabase {
  CityDao get personDao;
}
