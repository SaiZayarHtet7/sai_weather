import 'package:flutter/material.dart';
import 'package:sai_weather/data/data.dart';

import 'presentation/modules/city/city.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/modules/search_city/search_city.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppWidget();
  }
}

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchCityBloc>(
          create: (context) => SearchCityBloc(ICityRepo()),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Sai Weather",
          home: FavCity()),
    );
  }
}
