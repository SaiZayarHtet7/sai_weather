import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../custom/custom.dart';

class WarningText extends StatelessWidget {
  const WarningText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: WeatherText(
        StringUtils.warningCityText,
        color: ColorUtils.errorColor,
      ),
    );
  }
}
