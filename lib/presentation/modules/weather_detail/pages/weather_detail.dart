import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sai_weather/core/core.dart';
import 'package:sai_weather/data/data.dart';
import 'package:sai_weather/presentation/custom/custom.dart';
import 'package:sai_weather/presentation/modules/city/bloc/fav_city_bloc.dart';
import 'package:sai_weather/presentation/modules/city/cubit/check_fav_cubit.dart';

import '../bloc/forecast_detail_bloc.dart';

class WeatherDetail extends StatefulWidget {
  final CityModel cityModel;
  const WeatherDetail({super.key, required this.cityModel});

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ForecastDetailBloc>(
          create: (context) => ForecastDetailBloc(ICityRepo())
            ..add(GetForecastDetail(widget.cityModel)),
        ),
        BlocProvider<CheckFavCubit>(
          create: (context) =>
              CheckFavCubit()..checkFav(cityModel: widget.cityModel),
        ),
      ],
      child: BlocListener<CheckFavCubit, bool>(
        listener: (context, state) {
          // if (state) {

          state.toString().log(title: "state of check cubit ");
          context.read<FavCityBloc>().add(CheckFavCityList());
          // } else {
          //   context.read<FavCityBloc>().add(CheckFavCityList());
          // }
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: WeatherText(
              widget.cityModel.name,
              color: Colors.white,
            ),
            actions: [
              BlocBuilder<CheckFavCubit, bool>(
                builder: (context, isFav) {
                  return IconButton(
                      onPressed: () {
                        if (isFav) {
                          context
                              .read<CheckFavCubit>()
                              .removeFav(cityModel: widget.cityModel);
                        } else {
                          context
                              .read<CheckFavCubit>()
                              .addFavorite(cityModel: widget.cityModel);
                        }
                      },
                      icon: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.pink,
                      ));
                },
              )
            ],
          ),
          body: Container(
              padding: EdgeInsets.all(PaddingUtils.p12),
              child: BlocBuilder<ForecastDetailBloc, ForecastDetailState>(
                builder: (context, state) {
                  state.toString().log(title: "forecast detail state");

                  ///loading
                  if (state is ForecastDetailLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  ///error
                  if (state is ForecastDetailError) {
                    return Center(
                      child: WeatherText(state.error),
                    );
                  }

                  ///data state
                  if (state is ForecastDetailData) {
                    return SingleChildScrollView(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Column(
                          children: [
                            20.height,
                            Center(
                                child: WeatherText(
                              widget.cityModel.name,
                              style: FontUtils.nameText,
                            )),
                            Center(
                                child: WeatherText(
                              DateTime.now().toString().formattedDate,
                              style: FontUtils.bodyText,
                            )),
                            10.height,
                            TempAndWeather(
                              forecastResponseModel:
                                  state.forecastResponseModel,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: WeatherText(
                                StringUtils.hourly,
                                style: FontUtils.captionText,
                              ),
                            ),
                            10.height,
                            HourlyForecast(
                              forecastResponseModel:
                                  state.forecastResponseModel,
                            ),
                            20.height,
                            Align(
                              alignment: Alignment.centerLeft,
                              child: WeatherText(
                                StringUtils.nextThreeDays,
                                style: FontUtils.captionText,
                              ),
                            ),
                            10.height,
                            ThreeDayForecast(
                              forecastResponseModel:
                                  state.forecastResponseModel,
                            )
                          ],
                        ),
                      ),
                    );
                  }

                  return const SizedBox();
                },
              )),
        ),
      ),
    );
  }
}

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
                  Image.network(
                    image,
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
            child: Image.network(
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
