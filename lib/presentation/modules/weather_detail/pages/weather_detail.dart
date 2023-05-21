import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sai_weather/core/core.dart';
import 'package:sai_weather/data/data.dart';
import 'package:sai_weather/presentation/custom/custom.dart';

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
    return BlocProvider<ForecastDetailBloc>(
      create: (context) => ForecastDetailBloc(ICityRepo())
        ..add(GetForecastDetail(widget.cityModel)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: WeatherText(
            widget.cityModel.name,
            color: Colors.white,
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.favorite))],
        ),
        body: Container(
            padding: EdgeInsets.all(PaddingUtils.p12),
            child: BlocBuilder<ForecastDetailBloc, ForecastDetailState>(
              builder: (context, state) {
                state.toString().log(title: "forecast detail state");
                if (state is ForecastDetailLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is ForecastDetailError) {
                  return Center(
                    child: WeatherText(state.error),
                  );
                }

                if (state is ForecastDetailData) {
                  return Column(
                    children: [
                      Center(
                          child: WeatherText(
                        widget.cityModel.name,
                        style: FontUtils.nameText,
                      )),
                      Center(
                          child: WeatherText(
                        DateTime.now().toString(),
                        style: FontUtils.bodyText,
                      )),
                    ],
                  );
                }

                return const SizedBox();
              },
            )),
      ),
    );
  }
}
