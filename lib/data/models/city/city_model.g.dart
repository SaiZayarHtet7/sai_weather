// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      country: json['country'] as String,
      id: json['id'] as int,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      name: json['name'] as String,
      region: json['region'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'country': instance.country,
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
      'name': instance.name,
      'region': instance.region,
      'url': instance.url,
    };
