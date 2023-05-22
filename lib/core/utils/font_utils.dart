import 'package:flutter/material.dart';

import 'color_utils.dart';

class FontUtils {
  static TextStyle bodyText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: ColorUtils.textColor);

  static TextStyle titleText = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: ColorUtils.textColor);

  static TextStyle nameText =
      TextStyle(fontSize: 30, color: ColorUtils.textColor);

  static TextStyle captionText =
      TextStyle(fontSize: 20, color: ColorUtils.textColor);
}
