import 'package:flutter/material.dart';

extension DialogExtension on BuildContext {
  void showMyDialog({
    required Widget child,
  }) {
    Dialog dialog = Dialog(
        backgroundColor: Colors.white,
        insetAnimationCurve: Curves.easeIn,
        insetAnimationDuration: const Duration(seconds: 2),
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(padding: const EdgeInsets.all(20), child: child));

    showDialog(context: this, builder: (ctx) => dialog);
  }
}
