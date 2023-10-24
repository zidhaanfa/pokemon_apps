import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../baseData.dart';
import '../config.dart';

class CardLoadingCustom extends StatelessWidget {
  CardLoadingCustom({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return CardLoading(
      height: height,
      curve: Curves.decelerate,
      cardLoadingTheme: CardLoadingTheme(
          colorOne: ZFOtherColors.silver,
          colorTwo: Colors.grey.withOpacity(0.2)),
      width: width,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      margin: const EdgeInsets.only(bottom: 10),
    );
  }
}
