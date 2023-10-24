import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../baseData.dart';
import '../config.dart';

class ZFTextForButton extends StatelessWidget {
  const ZFTextForButton({
    Key? key,
    required this.fontType,
    required this.text,
    this.colorText,
  }) : super(key: key);

  final FontType fontType;
  final String text;
  final Color? colorText;
  @override
  Widget build(BuildContext context) {
    double? fontSizes;
    FontWeight? fontWeights;
    double? opacity;
    switch (fontType) {
      case FontType.bigTitleBold1: // bigTitleBold1
        fontSizes = ZFFontSizeCustom.bigTitle1;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.bigTitleBold2: // bigTitleBold2
        fontSizes = ZFFontSizeCustom.bigTitle2;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.bigTitle1: // bigTitle1
        fontSizes = ZFFontSizeCustom.bigTitle1;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.bigTitle2: // bigTitle2
        fontSizes = ZFFontSizeCustom.bigTitle2;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.bigTitleOp1: // bigTitleOp1
        fontSizes = ZFFontSizeCustom.bigTitle1;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.bigTitleOp2: // bigTitleOp2
        fontSizes = ZFFontSizeCustom.bigTitle2;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.titleBold: // titleBold
        fontSizes = ZFFontSizeCustom.title;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.title: // title
        fontSizes = ZFFontSizeCustom.title;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.titleOp: // titleOp
        fontSizes = ZFFontSizeCustom.title;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.subtitleBold: // SubtitleBold
        fontSizes = ZFFontSizeCustom.subtitle;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.subtitle: // subtitle
        fontSizes = ZFFontSizeCustom.subtitle;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.subtitleOp: // subtitleOp
        fontSizes = ZFFontSizeCustom.subtitle;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.bodyBold: // bodyBold
        fontSizes = ZFFontSizeCustom.body;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.body: // body
        fontSizes = ZFFontSizeCustom.body;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.bodyOp: // bodyOp
        fontSizes = ZFFontSizeCustom.body;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.captionBold: // captionBold
        fontSizes = ZFFontSizeCustom.caption;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.caption: // caption
        fontSizes = ZFFontSizeCustom.caption;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.captionOp: // captionOp
        fontSizes = ZFFontSizeCustom.caption;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      default:
    }
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSizes,
        fontFamily: FontFamilyType.primary,
        fontWeight: fontWeights,
        overflow: TextOverflow.ellipsis,
        color: colorText ??
            (Get.isDarkMode == true
                ? ZFTextColors.textWhite.withOpacity(opacity!)
                : ZFTextColors.textBlack.withOpacity(opacity!)),
      ),
    );
  }
}
