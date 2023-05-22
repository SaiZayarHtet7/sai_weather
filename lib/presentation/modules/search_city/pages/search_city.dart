import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sai_weather/core/core.dart';
import 'package:sai_weather/presentation/custom/custom.dart';
import 'package:sai_weather/presentation/modules/search_city/search_city.dart';

class SearchCity extends StatefulWidget {
  const SearchCity({super.key});

  @override
  State<SearchCity> createState() => _SearchCityState();
}

class _SearchCityState extends State<SearchCity> {
  final cityNameController = TextEditingController();
  @override
  void initState() {
    context.read<SearchCityBloc>().add(const RunSearchCity(""));
    super.initState();
  }

  @override
  void dispose() {
    cityNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(
          title: WeatherText(
        StringUtils.searchCity,
        color: Colors.white,
      )),
      body: Container(
        padding: EdgeInsets.all(PaddingUtils.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Search field of City name
            WeatherTextField(
              controller: cityNameController,
              hint: StringUtils.enterCity,
              onChanged: (cityName) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  context.read<SearchCityBloc>().add(RunSearchCity(cityName));
                });
              },
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top: PaddingUtils.p12),
                child: BlocBuilder<SearchCityBloc, SearchCityState>(
                  builder: (context, state) {
                    // state.toString().log(title: "search city state ");
                    //loading state
                    if (state is SearchCityLoading) {
                      return const LoadingWidget();
                    }
                    if (state is SearchCityNoData) {
                      return Center(
                        child: WeatherText(
                          StringUtils.noCity,
                        ),
                      );
                    }
                    if (state is SearchCityError) {
                      return ErrorText(error: state.error);
                    }

                    if (state is SearchCityWarning) {
                      return const WarningText();
                    }

                    if (state is SearchCityData) {
                      return CityWidget(cityList: state.cityList);
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
