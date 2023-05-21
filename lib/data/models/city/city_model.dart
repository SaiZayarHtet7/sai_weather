import 'package:floor/floor.dart';

import '../../../domain/domain.dart';

import 'package:json_annotation/json_annotation.dart';

part 'city_model.g.dart';

@JsonSerializable()
@entity
class CityModel implements City {
  @override
  final String country;

  @override
  @primaryKey
  final int id;

  @override
  final double lat;

  @override
  final double lon;

  @override
  final String name;

  @override
  final String region;

  @override
  final String url;

  CityModel(
      {required this.country,
      required this.id,
      required this.lat,
      required this.lon,
      required this.name,
      required this.region,
      required this.url});
  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}
