import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:card_loading/card_loading.dart';
import 'package:get/get.dart';

import '../baseData.dart';
import '../config.dart';
import '../widget/ZFText.dart';

const kartu3 = CardLoading(
  height: 160,
);
const kartu2 = CardLoading(
  borderRadius: BorderRadius.all(Radius.circular(30)),
  height: 50,
);

const kartu = CardLoading(
  height: 10,
  width: 200,
  borderRadius: BorderRadius.all(Radius.circular(10)),
  margin: EdgeInsets.only(bottom: 10),
);
final kartu4 = CardLoading(
  height: 22,
  curve: Curves.decelerate,
  cardLoadingTheme: CardLoadingTheme(
    colorOne: ZFOtherColors.silver,
    colorTwo: ZFOtherColors.silver.withOpacity(0.5),
  ),
  width: MediaQuery.of(Get.context!).size.width,
  borderRadius: const BorderRadius.all(Radius.circular(25)),
  margin: const EdgeInsets.only(bottom: 10),
);
final kartuSell = CardLoading(
  height: 60,
  curve: Curves.decelerate,
  cardLoadingTheme: CardLoadingTheme(
    colorOne: ZFOtherColors.silver,
    colorTwo: ZFOtherColors.silver.withOpacity(0.5),
  ),
  width: MediaQuery.of(Get.context!).size.width,
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  margin: const EdgeInsets.only(bottom: 10),
);
final kartuLingkaran = CardLoading(
  height: 40,
  curve: Curves.decelerate,
  cardLoadingTheme: CardLoadingTheme(
    colorOne: ZFOtherColors.silver,
    colorTwo: ZFOtherColors.silver.withOpacity(0.5),
  ),
  width: MediaQuery.of(Get.context!).size.width,
  borderRadius: const BorderRadius.all(Radius.circular(40)),
  margin: const EdgeInsets.only(bottom: 10),
);
Future<void> betterShowMessage(
    {required context,
    required String title,
    required Widget content,
    bool? isButton,
    List<Widget>? buttons,
    Function()? onDefaultOK}) {
  buttons ??= [
    TextButton(
        onPressed: onDefaultOK ??
            () {
              Navigator.pop(context);
            },
        child: const Text('OK')),
  ];

  return showDialog(
      context: context,
      // barrierDismissible: true, // user must tap button!
      builder: (ctx) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: ZFText(
              text: title,
              maxLines: 10,
              fontType: FontType.titleBold,
              textAlignment: MainAxisAlignment.start,
              // colorText: ZFOtherColors.white,
            ),
            content: content,
            actions: isButton == false ? null : buttons,
          );
        });
      });
}

String getActualPassword(String? encoded64) {
  return utf8.decode(base64.decode(encoded64!));
}
