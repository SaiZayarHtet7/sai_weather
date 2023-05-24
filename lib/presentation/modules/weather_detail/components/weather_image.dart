import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../data/data.dart';
import '../../../custom/custom.dart';

class WeatherImage extends StatelessWidget {
  final ForecastResponseModel forecastResponseModel;
  const WeatherImage({
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
            child: CachedNetworkImage(
              imageUrl:
                  "https:${forecastResponseModel.current!.condition.icon}",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          )),
        ),
        WeatherText(
          forecastResponseModel.current!.condition.text,
          style: FontUtils.titleText,
        ),
      ]),
    );
  }
}
