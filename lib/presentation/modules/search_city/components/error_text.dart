import "package:flutter/material.dart";

import '../../../../core/core.dart';
import '../../../custom/custom.dart';

class ErrorText extends StatelessWidget {
  final String error;
  const ErrorText({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: WeatherText(
        error,
        color: ColorUtils.errorColor,
      ),
    );
  }
}
