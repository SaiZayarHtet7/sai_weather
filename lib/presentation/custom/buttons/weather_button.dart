import "package:flutter/material.dart";
import 'package:sai_weather/presentation/custom/custom.dart';

import '../../../core/core.dart';

class WeatherButton extends StatelessWidget {
  final Function() onPressed;
  final String text;
  final double? width;
  const WeatherButton(
      {super.key, required this.onPressed, required this.text, this.width});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width ?? 100,
      onPressed: () => onPressed(),
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: ColorUtils.primaryColor,
      child: WeatherText(text, color: Colors.white),
    );
  }
}
