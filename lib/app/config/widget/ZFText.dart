import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../baseData.dart';
import '../config.dart';

class ZFText extends StatelessWidget {
  const ZFText({
    Key? key,
    required this.text,
    required this.maxLines,
    required this.fontType,
    required this.textAlignment,
    this.colorText,
    this.icon,
    this.startIcon,
    this.colorIcon,
    this.iconSized,
  }) : super(key: key);

  final String text;
  final int maxLines;
  final MainAxisAlignment textAlignment;
  final FontType fontType;
  final Color? colorText;
  final IconData? icon;
  final bool? startIcon;
  final Color? colorIcon;
  final double? iconSized;

  @override
  Widget build(BuildContext context) {
    double? fontSizes;
    double? iconSize;
    FontWeight? fontWeights;
    double? opacity;
    switch (fontType) {
      case FontType.bigTitleBold1: // bigTitleBold1
        fontSizes = ZFFontSizeCustom.bigTitle1;
        iconSize = ZFFontSizeCustom.bigTitle1 + 5;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.bigTitleBold2: // bigTitleBold2
        fontSizes = ZFFontSizeCustom.bigTitle2;
        iconSize = ZFFontSizeCustom.bigTitle2 + 5;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.bigTitle1: // bigTitle1
        fontSizes = ZFFontSizeCustom.bigTitle1;
        iconSize = ZFFontSizeCustom.bigTitle1 + 5;

        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.bigTitle2: // bigTitle2
        fontSizes = ZFFontSizeCustom.bigTitle2;
        iconSize = ZFFontSizeCustom.bigTitle2 + 5;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.bigTitleOp1: // bigTitleOp1
        fontSizes = ZFFontSizeCustom.bigTitle1;
        iconSize = ZFFontSizeCustom.bigTitle1 + 5;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.bigTitleOp2: // bigTitleOp2
        fontSizes = ZFFontSizeCustom.bigTitle2;
        iconSize = ZFFontSizeCustom.bigTitle2 + 5;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.bigTitleBold: // bigTitle
        fontSizes = ZFFontSizeCustom.bigTitle;
        iconSize = ZFFontSizeCustom.bigTitle + 5;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.bigTitle: // bigTitle
        fontSizes = ZFFontSizeCustom.bigTitle;
        iconSize = ZFFontSizeCustom.bigTitle + 5;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.bigTitleOp: // bigTitle
        fontSizes = ZFFontSizeCustom.bigTitle;
        iconSize = ZFFontSizeCustom.bigTitle + 5;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.titleBold: // titleBold
        fontSizes = ZFFontSizeCustom.title;
        iconSize = ZFFontSizeCustom.title + 5;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.title: // title
        fontSizes = ZFFontSizeCustom.title;
        iconSize = ZFFontSizeCustom.title + 5;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.titleOp: // titleOp
        fontSizes = ZFFontSizeCustom.title;
        iconSize = ZFFontSizeCustom.title + 5;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.smallTitleBold: // titleBold
        fontSizes = ZFFontSizeCustom.smallTitle;
        iconSize = ZFFontSizeCustom.smallTitle + 5;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.smallTitle: // title
        fontSizes = ZFFontSizeCustom.smallTitle;
        iconSize = ZFFontSizeCustom.smallTitle + 5;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.smallTitleOp: // titleOp
        fontSizes = ZFFontSizeCustom.smallTitle;
        iconSize = ZFFontSizeCustom.smallTitle + 5;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.subtitleBold: // SubtitleBold
        fontSizes = ZFFontSizeCustom.subtitle;
        iconSize = ZFFontSizeCustom.subtitle + 5;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.subtitle: // subtitle
        fontSizes = ZFFontSizeCustom.subtitle;
        iconSize = ZFFontSizeCustom.subtitle + 5;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.subtitleOp: // subtitleOp
        fontSizes = ZFFontSizeCustom.subtitle;
        iconSize = ZFFontSizeCustom.subtitle + 5;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.bodyBold: // bodyBold
        fontSizes = ZFFontSizeCustom.body;
        iconSize = ZFFontSizeCustom.body + 5;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.body: // body
        fontSizes = ZFFontSizeCustom.body;
        iconSize = ZFFontSizeCustom.body + 5;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.bodyOp: // bodyOp
        fontSizes = ZFFontSizeCustom.body;
        iconSize = ZFFontSizeCustom.body + 5;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      case FontType.captionBold: // captionBold
        fontSizes = ZFFontSizeCustom.caption;
        iconSize = ZFFontSizeCustom.caption + 5;
        fontWeights = FontWeight.bold;
        opacity = 1;
        break;
      case FontType.caption: // caption
        fontSizes = ZFFontSizeCustom.caption;
        iconSize = ZFFontSizeCustom.caption + 5;
        fontWeights = FontWeight.normal;
        opacity = 1;
        break;
      case FontType.captionOp: // captionOp
        fontSizes = ZFFontSizeCustom.caption;
        iconSize = ZFFontSizeCustom.caption + 5;
        fontWeights = FontWeight.normal;
        opacity = 0.5;
        break;
      default:
    }
    return Row(
      mainAxisAlignment: textAlignment,
      children: [
        startIcon == true
            ? Icon(
                icon,
                size: iconSized ?? iconSize,
                color: colorText ??
                    (Get.isDarkMode == true
                        ? ZFTextColors.textWhite.withOpacity(opacity!)
                        : ZFTextColors.textBlack.withOpacity(opacity!)),
              )
            : SizedBox(
                width: 1,
              ),
        SizedBox(
          width: 5,
        ),
        Flexible(
          child: Text(
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
            maxLines: maxLines,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        startIcon == false
            ? Icon(
                icon,
                size: iconSized ?? iconSize,
                color: colorIcon ??
                    (Get.isDarkMode == true
                        ? ZFTextColors.textWhite.withOpacity(opacity!)
                        : ZFTextColors.textBlack.withOpacity(opacity!)),
              )
            : SizedBox(
                width: 1,
              ),
      ],
    );
  }
}
