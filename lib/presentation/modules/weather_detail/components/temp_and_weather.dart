import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../data/data.dart';
import 'components.dart';

class TempAndWeather extends StatelessWidget {
  final ForecastResponseModel forecastResponseModel;
  const TempAndWeather({
    Key? key,
    required this.forecastResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisSpacing: PaddingUtils.p12,
          crossAxisCount: 2),
      children: [
        TempWidget(forecastResponseModel: forecastResponseModel),
        WeatherImage(forecastResponseModel: forecastResponseModel)
      ],
    );
  }
}
