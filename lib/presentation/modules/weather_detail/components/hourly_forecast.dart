import 'package:flutter/material.dart';
import 'package:sai_weather/core/core.dart';

import '../../../../data/data.dart';
import '../../../custom/custom.dart';

class HourlyForecast extends StatelessWidget {
  final ForecastResponseModel forecastResponseModel;

  const HourlyForecast({
    Key? key,
    required this.forecastResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<EachHourModel> hourList =
        forecastResponseModel.forecast!.forecastday![0].hour!;
    var dateTimeSeconds = DateTime.now().millisecondsSinceEpoch / 1000;
    //to check the rest of hour than now time ;
    hourList = hourList.where(
      (hour) {
        int nowSecond = (dateTimeSeconds * 1000).toInt();
        var nowHour = DateTime.fromMillisecondsSinceEpoch(nowSecond);
        int checkSecond = (hour.timeEpoch! * 1000).toInt();
        var checkHour = DateTime.fromMillisecondsSinceEpoch(checkSecond);
        return int.parse(checkHour.toString().hour) >=
            int.parse(nowHour.toString().hour);
      },
    ).toList();

    return Container(
      height: 140,
      padding: EdgeInsets.all(PaddingUtils.p12),
      decoration: cardContainerDecoration,
      child: ListView.separated(
        separatorBuilder: (context, index) => 10.width,
        scrollDirection: Axis.horizontal,
        itemCount: hourList.length,
        itemBuilder: (context, index) {
          EachHourModel eachHour = hourList[index];
          eachHour.toJson().toString().log();
          String hour =
              DateTime.fromMillisecondsSinceEpoch(eachHour.timeEpoch! * 1000)
                  .toString()
                  .hour12;

          return SizedBox(
            width: 50,
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WeatherText(index == 0 ? "Now" : hour),
                Expanded(
                  child: Image.network(
                    "https:${eachHour.condition!.icon}",
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                  ),
                ),
                WeatherText("${eachHour.tempC!.toInt()}°C"),
              ],
            ),
          );
        },
      ),
    );
  }
}
