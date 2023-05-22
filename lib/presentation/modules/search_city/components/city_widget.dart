import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sai_weather/data/data.dart';
import 'package:sai_weather/presentation/modules/weather_detail/weather_detail.dart';

import '../../../../core/core.dart';
import '../../../custom/custom.dart';
import '../search_city.dart';

class CityWidget extends StatelessWidget {
  final List<CityModel> cityList;
  const CityWidget({super.key, required this.cityList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: cityList.length,
      itemBuilder: (context, index) {
        var city = cityList[index];
        return InkWell(
          onTap: () {

            context.push(WeatherDetail(cityModel: city));
          },
          child: Container(
            padding: EdgeInsets.all(PaddingUtils.p12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 1,
                  color: Colors.black,
                )),
            child: Row(children: [
              WeatherText("${city.name}(${city.country})"),
            ]),
          ),
        );
      },
      separatorBuilder: ((context, index) => 10.height),
    );
  }
}
