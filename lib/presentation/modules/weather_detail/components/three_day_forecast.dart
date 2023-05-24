import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../../data/data.dart';
import '../../../custom/custom.dart';

class ThreeDayForecast extends StatelessWidget {
  final ForecastResponseModel forecastResponseModel;

  const ThreeDayForecast({
    Key? key,
    required this.forecastResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardContainerDecoration,
      padding: EdgeInsets.all(PaddingUtils.p12),
      child: Column(children: [
        Row(
          children: [
            const Icon(Icons.calendar_today),
            10.width,
            WeatherText(
              StringUtils.threeDaysForecast,
              style:
                  FontUtils.titleText.copyWith(fontWeight: FontWeight.normal),
            )
          ],
        ),
        Divider(
          thickness: 1,
          color: ColorUtils.textColor,
        ),
        ListView.separated(
          padding: EdgeInsets.zero,
          separatorBuilder: (context, index) => index != 2
              ? Divider(
                  height: 10,
                  thickness: 1,
                  color: ColorUtils.textColor,
                )
              : const SizedBox(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: forecastResponseModel.forecast!.forecastday!.length,
          itemBuilder: (context, index) {
            var day = forecastResponseModel.forecast!.forecastday![index];
            var showDate =
                DateTime.fromMillisecondsSinceEpoch(day.dateEpoch! * 1000)
                    .toString()
                    .formattedDate;
            var eachDay =
                forecastResponseModel.forecast!.forecastday![index].day;
            var image = eachDay!.condition!.icon;
            image = "https:$image";
            var minTemp = "${eachDay.minTemp!.toInt()}°";
            var maxTemp = "${eachDay.maxTemp!.toInt()}°";
            return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(child: FittedBox(child: WeatherText(showDate))),
                  10.width,
                  CachedNetworkImage(
                    imageUrl: image,
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  Row(
                    children: [
                      WeatherText(
                        minTemp,
                        style: FontUtils.bodyText
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      WeatherText(StringUtils.minTemp)
                    ],
                  ),
                  Row(
                    children: [
                      WeatherText(
                        maxTemp,
                        style: FontUtils.bodyText
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      WeatherText(StringUtils.maxTemp)
                    ],
                  )
                ]);
          },
        )
      ]),
    );
  }
}
