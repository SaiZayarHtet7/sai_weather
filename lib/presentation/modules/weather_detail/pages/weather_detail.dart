import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sai_weather/core/core.dart';
import 'package:sai_weather/data/data.dart';
import 'package:sai_weather/presentation/custom/custom.dart';
import 'package:sai_weather/presentation/modules/city/bloc/fav_city_bloc.dart';
import 'package:sai_weather/presentation/modules/city/cubit/check_fav_cubit.dart';

import '../bloc/forecast_detail_bloc.dart';
import '../components/components.dart';



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

          // state.toString().log(title: "state of check cubit ");
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
                  // state.toString().log(title: "forecast detail state");

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
