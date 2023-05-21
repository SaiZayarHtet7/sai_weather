// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_db.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CityDao? _personDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `CityModel` (`country` TEXT NOT NULL, `id` INTEGER NOT NULL, `lat` REAL NOT NULL, `lon` REAL NOT NULL, `name` TEXT NOT NULL, `region` TEXT NOT NULL, `url` TEXT NOT NULL, `id` INTEGER NOT NULL, `name` TEXT NOT NULL, `region` TEXT NOT NULL, `country` TEXT NOT NULL, `lat` REAL NOT NULL, `lon` REAL NOT NULL, `url` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CityDao get personDao {
    return _personDaoInstance ??= _$CityDao(database, changeListener);
  }
}

class _$CityDao extends CityDao {
  _$CityDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _cityModelInsertionAdapter = InsertionAdapter(
            database,
            'CityModel',
            (CityModel item) => <String, Object?>{
                  'country': item.country,
                  'id': item.id,
                  'lat': item.lat,
                  'lon': item.lon,
                  'name': item.name,
                  'region': item.region,
                  'url': item.url,
                  'id': item.id,
                  'name': item.name,
                  'region': item.region,
                  'country': item.country,
                  'lat': item.lat,
                  'lon': item.lon,
                  'url': item.url
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CityModel> _cityModelInsertionAdapter;

  @override
  Future<List<CityModel>> findAllPeople() async {
    return _queryAdapter.queryList('SELECT * FROM City',
        mapper: (Map<String, Object?> row) => CityModel(
            country: row['country'] as String,
            id: row['id'] as int,
            lat: row['lat'] as double,
            lon: row['lon'] as double,
            name: row['name'] as String,
            region: row['region'] as String,
            url: row['url'] as String));
  }

  @override
  Stream<List<String>> getAllCity() {
    return _queryAdapter.queryListStream('SELECT name FROM City',
        mapper: (Map<String, Object?> row) => row.values.first as String,
        queryableName: 'City',
        isView: false);
  }

  @override
  Stream<CityModel?> findCityById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Person WHERE id = ?1',
        mapper: (Map<String, Object?> row) => CityModel(
            country: row['country'] as String,
            id: row['id'] as int,
            lat: row['lat'] as double,
            lon: row['lon'] as double,
            name: row['name'] as String,
            region: row['region'] as String,
            url: row['url'] as String),
        arguments: [id],
        queryableName: 'Person',
        isView: false);
  }

  @override
  Future<void> addFavoriteCity(CityModel person) async {
    await _cityModelInsertionAdapter.insert(person, OnConflictStrategy.abort);
  }
}
