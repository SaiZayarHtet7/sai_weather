import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sai_weather/core/core.dart';

import '../../../custom/custom.dart';
import '../../search_city/search_city.dart';
import '../bloc/fav_city_bloc.dart';

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
        title: WeatherText(
          StringUtils.favoriteCities,
          color: Colors.white,
        ),
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
      body: Container(
        padding: EdgeInsets.all(PaddingUtils.p12),
        child: BlocBuilder<FavCityBloc, FavCityState>(
          builder: (context, state) {
            state.toString().log(title: "fav city state ");
            if (state is FavCityData) {
              return CityWidget(cityList: state.cityList);
            }
            if (state is FavCityLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
                child: WeatherButton(
              onPressed: () {
                context.push(const SearchCity());
              },
              text: StringUtils.searchCity,
            ));
          },
        ),
      ),
    );
  }
}
