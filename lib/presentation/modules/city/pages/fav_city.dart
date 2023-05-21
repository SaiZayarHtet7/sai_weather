import 'package:flutter/material.dart';
import 'package:sai_weather/core/core.dart';

import '../../../custom/custom.dart';
import '../../search_city/search_city.dart';

class FavCity extends StatefulWidget {
  const FavCity({super.key});

  @override
  State<FavCity> createState() => _FavCityState();
}

class _FavCityState extends State<FavCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: WeatherText(StringUtils.favoriteCities,color: Colors.white,),
        actions: [
          IconButton(
            onPressed: () {
              context.push(const SearchCity());
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: Center(
          child: WeatherButton(
        onPressed: () {
          context.push(const SearchCity());
        },
        text: StringUtils.searchCity,
      )),
    );
  }
}
