import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:sai_weather/core/core.dart';

import '../../../custom/custom.dart';
import '../../search_city/search_city.dart';
import '../bloc/fav_city_bloc.dart';

class FavCity extends StatefulWidget {
  const FavCity({super.key});

  @override
  State<FavCity> createState() => _FavCityState();
}

class _FavCityState extends State<FavCity> {
  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    registerNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: WeatherText(
          StringUtils.favoriteCities,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(const SearchCity());
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(PaddingUtils.p12),
        child: BlocBuilder<FavCityBloc, FavCityState>(
          builder: (context, state) {
            // state.toString().log(title: "fav city state ");
            if (state is FavCityData) {
              return CityWidget(cityList: state.cityList);
            }
            if (state is FavCityLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const WeatherText("No City "),
                10.height,
                WeatherButton(
                  onPressed: () {
                    context.push(const SearchCity());
                  },
                  text: StringUtils.searchCity,
                ),
              ],
            ));
          },
        ),
      ),
    );
  }

  void registerNotification() async {
    await setupFlutterNotifications();
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      'User granted permission'.log();

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message received
        "messaging data ${message.notification!.body}".log();
        showFlutterNotification(message);
      });
    }
  }

  late AndroidNotificationChannel channel;

  bool isFlutterLocalNotificationsInitialized = false;

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: '@mipmap/ic_launcher',
          ),
        ),
      );
    }
  }
}
