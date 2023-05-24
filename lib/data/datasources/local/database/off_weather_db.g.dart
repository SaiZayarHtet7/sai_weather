// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'off_weather_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorOffWeatherDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$OffWeatherDatabaseBuilder databaseBuilder(String name) =>
      _$OffWeatherDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$OffWeatherDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$OffWeatherDatabaseBuilder(null);
}

class _$OffWeatherDatabaseBuilder {
  _$OffWeatherDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$OffWeatherDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$OffWeatherDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<OffWeatherDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$OffWeatherDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$OffWeatherDatabase extends OffWeatherDatabase {
  _$OffWeatherDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  OffWeatherDao? _offWeatherDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `OffWeatherDetailModel` ( `weatherJson` TEXT NOT NULL, `cityId` INTEGER NOT NULL, `dateTime` TEXT NOT NULL, PRIMARY KEY (`cityId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  OffWeatherDao get offWeatherDao {
    return _offWeatherDaoInstance ??= _$OffWeatherDao(database, changeListener);
  }
}

class _$OffWeatherDao extends OffWeatherDao {
  _$OffWeatherDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _offWeatherDetailModelInsertionAdapter = InsertionAdapter(
            database,
            'OffWeatherDetailModel',
            (OffWeatherDetailModel item) => <String, Object?>{
                  'dateTime': item.dateTime,
                  'cityId': item.cityId,
                  'weatherJson': item.weatherJson,
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<OffWeatherDetailModel>
      _offWeatherDetailModelInsertionAdapter;

  @override
  Future<List<OffWeatherDetailModel>> getWeatherDetailById(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM OffWeatherDetailModel WHERE cityId = ?1',
        mapper: (Map<String, Object?> row) => OffWeatherDetailModel(
            cityId: row['cityId'] as int,
            dateTime: row['dateTime'] as String,
            weatherJson: row['weatherJson'] as String),
        arguments: [id]);
  }

  @override
  Future<void> insertOffWeatherDetailModel(
      OffWeatherDetailModel offWeatherDetailModel) async {
    await _offWeatherDetailModelInsertionAdapter.insert(
        offWeatherDetailModel, OnConflictStrategy.replace);
  }
}
