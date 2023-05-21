import 'package:flutter/material.dart';
import 'package:sai_weather/core/extensions/device_size_extension.dart';
import 'package:sai_weather/core/extensions/sb_extension.dart';
import 'package:sai_weather/presentation/custom/custom.dart';

import '../../../core/core.dart';

class MySnackBar extends StatelessWidget {
  final String title, body;

  const MySnackBar({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: context.deviceWidth(80),
        margin: EdgeInsets.symmetric(horizontal: context.deviceWidth(10)),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ColorUtils.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WeatherText(
                title,
                style: FontUtils.titleText.copyWith(color: Colors.white),
              ),
              10.height,
              WeatherText(
                body,
                color: Colors.white,
              ),
            ]),
      ),
    );
  }
}
