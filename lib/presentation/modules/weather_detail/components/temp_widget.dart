import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../data/data.dart';
import '../../../custom/custom.dart';

class TempWidget extends StatelessWidget {
  final ForecastResponseModel forecastResponseModel;
  const TempWidget({
    Key? key,
    required this.forecastResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardContainerDecoration,
      padding: EdgeInsets.all(PaddingUtils.p12),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: Center(
            child: FittedBox(
              child: WeatherText(
                "${forecastResponseModel.current!.tempC.toInt()}°C",
                style: FontUtils.titleText
                    .copyWith(fontSize: 50, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        WeatherText(
          "feel like ${forecastResponseModel.current!.feelLikeC}°C",
          style: FontUtils.titleText,
        )
      ]),
    );
  }
}
