//  "id": 1586549,
//         "name": "Yangon",
//         "region": "Yangon",
//         "country": "Myanmar",
//         "lat": 16.78,
//         "lon": 96.17,
//         "url": "yangon-yangon-myanmar"

abstract class City {
  final int id;
  final String name;
  final String region;
  final String country;
  final double lat;
  final double lon;
  final String url;

  City(
      {required this.id,
      required this.name,
      required this.region,
      required this.country,
      required this.lat,
      required this.lon,
      required this.url});
}
