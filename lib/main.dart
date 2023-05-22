import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:sai_weather/core/core.dart';
import 'package:sai_weather/data/data.dart';
import 'package:sai_weather/presentation/modules/city/bloc/fav_city_bloc.dart';

import 'firebase_options.dart';
import 'presentation/modules/city/city.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/modules/search_city/search_city.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance
      .subscribeToTopic("all_noti")
      .then((value) => "subscribe topic".log(title: "noti topics"));

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
        BlocProvider<FavCityBloc>(
          create: (context) => FavCityBloc()..add(CheckFavCityList()),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Sai Weather",
          home: FavCity()),
    );
  }
}
