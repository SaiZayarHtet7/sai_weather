import 'package:flutter/material.dart';

import '../../../core/core.dart';

class WeatherTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPass, isEnabled, isBtn;
  final TextInputType textInputType;
  final Widget? suffix;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;

  const WeatherTextField(
      {Key? key,
      required this.controller,
      this.focusNode,
      required this.hint,
      this.isPass = false,
      this.isEnabled = true,
      this.isBtn = false,
      this.suffix,
      this.textInputType = TextInputType.text,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      obscureText: isPass,
      enabled: isEnabled && !isBtn,
      style: FontUtils.bodyText,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textInputType,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        isDense: true,
        errorStyle: FontUtils.bodyText
            .copyWith(color: ColorUtils.errorColor, fontSize: 15),
        fillColor: ColorUtils.textFieldColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: ColorUtils.textFieldColor, width: 1),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        hintText: hint,
      ),
    );
  }
}
