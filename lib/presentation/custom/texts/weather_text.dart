import 'package:flutter/material.dart';

import '../../../core/core.dart';

class WeatherText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Color? color;
  const WeatherText(this.text, {super.key, this.style, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          FontUtils.bodyText.copyWith(color: color ?? ColorUtils.textColor),
    );
  }
}
