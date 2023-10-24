import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/material.dart';

import '../baseData.dart';

snackbar(status, message, duration, button) {
  // Use this if you need best snackbar awwwwwww
  final Color success = ZFBaseColors.success;
  final Color error = ZFBaseColors.error;
  final Color info = ZFBaseColors.info;
  final Color successNoFound = ZFBaseColors.warning;
  final Color colors;
  final Color textColor;
  final Color textwhite = ZFTextColors.textWhite;
  final Color textblack = ZFTextColors.textBlack;
  if (status == "success") {
    colors = success;
    textColor = textblack;
  } else if (status == "warning") {
    colors = successNoFound;
    textColor = textblack;
  } else if (status == "info") {
    colors = info;
    textColor = textblack;
  } else {
    colors = error;
    textColor = textwhite;
  }
  Get.snackbar(
    status,
    message,
    colorText: ZFTextColors.textWhite,
    backgroundColor: colors,
    mainButton: button,
    duration: Duration(seconds: duration),
    icon: Icon(
      Icons.error,
      color: ZFTextColors.textWhite,
    ),
    animationDuration: const Duration(milliseconds: 1000),
  );
}
