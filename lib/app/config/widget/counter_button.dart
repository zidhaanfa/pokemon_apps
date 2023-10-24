import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../baseData.dart';
import '../config.dart';
// import '../theme/theme.dart';
import 'ZFText.dart';

///Counter button class
class CounterButton extends StatelessWidget {
  ///Constructor for the counter button
  CounterButton({
    Key? key,
    required this.text,
    required this.onTapMin,
    required this.onTapPlus,
  }) : super(key: key);

  String text;
  void Function() onTapMin;
  void Function() onTapPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          InkWell(
            onTap: onTapMin,
            child: Container(
              decoration: BoxDecoration(
                color: ZFOtherColors.white,
                border: Border.all(
                  color: ZFBaseColors.primary,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  // topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  // bottomRight: Radius.circular(30.0),
                ),
              ),
              width: 30,
              height: 30,
              child: Icon(
                Icons.minimize,
                size: 20,
                color: ZFTextColors.textBlack,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: ZFOtherColors.white,
              border: Border.all(
                color: ZFBaseColors.primary,
              ),
              borderRadius: const BorderRadius.only(
                  // topLeft: Radius.circular(30.0),
                  // topRight: Radius.circular(30.0),
                  // bottomLeft: Radius.circular(30.0),
                  // bottomRight: Radius.circular(30.0),
                  ),
            ),
            width: 30,
            height: 30,
            child: Center(
              child: ZFText(
                text: "${text}",
                maxLines: 1,
                fontType: FontType.bodyBold,
                textAlignment: MainAxisAlignment.center,
                colorText: ZFOtherColors.black,
              ),
            ),
          ),
          InkWell(
            onTap: onTapPlus,
            child: Container(
              decoration: BoxDecoration(
                color: ZFOtherColors.white,
                border: Border.all(
                  color: ZFBaseColors.primary,
                ),
                borderRadius: const BorderRadius.only(
                  // topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  // bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
              ),
              width: 30,
              height: 30,
              child: Icon(
                Icons.add,
                size: 20,
                color: ZFOtherColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
