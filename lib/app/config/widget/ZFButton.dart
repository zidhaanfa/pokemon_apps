import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../baseData.dart';
import '../config.dart';
import 'ZFTextForButton.dart';

class ZFButton extends StatelessWidget {
  ZFButton({
    /// you must check the 'ButtonType' and 'FontType' in the ZFConfig.dart
    /// you can add more button type and font type in the ZFConfig.dart
    /// you can add text and icon in the button
    /// you can add button height and button width
    /// you can add onPressedButton and isEnable
    /// you can add withIcon and withText
    Key? key,
    required this.fontType,
    required this.buttonType,
    this.text,
    this.icon,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.onPressedButton,
    required this.isEnable,
    required this.withIcon,
    required this.withText,
    this.color,
    this.colorText,
    this.colorIcon,
  }) : super(key: key);

  final FontType fontType;
  final ButtonType buttonType;
  String? text;
  bool withIcon;
  bool withText;
  IconData? icon;
  double buttonHeight;
  double buttonWidth;
  void Function() onPressedButton;
  bool isEnable;
  Color? color;
  Color? colorText;
  Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    Color? colorButton;
    Color? textColor;
    IconData? icons;

    switch (buttonType) {
      case ButtonType.solidWithIcon:
        colorButton = color ?? ZFButtonColors.button;
        textColor = colorText ?? ZFButtonColors.textButtonRev;
        icons = icon;
        break;
      case ButtonType.outlineWithIcon:
        colorButton = ZFBaseColors.transparent;
        textColor = colorText ?? ZFButtonColors.textButton;
        icons = icon;
        break;
      default:
    }
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      child: MaterialButton(
        onPressed: isEnable ? onPressedButton : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            withIcon
                ? Icon(
                    icons ?? Icons.error,
                    color: colorIcon ?? textColor,
                  )
                : SizedBox(
                    width: 0,
                    height: 0,
                  ),
            SizedBox(
              width: 5,
            ),
            withText
                ? ZFTextForButton(
                    fontType: fontType,
                    text: text ?? 'Null',
                    colorText: textColor,
                  )
                : SizedBox(
                    width: 0,
                    height: 0,
                  ),
          ],
        ),
        color: color ?? ZFButtonColors.button,
        animationDuration: Duration(seconds: 1),
        autofocus: true,
        disabledColor: ZFButtonColors.buttonDisable.withOpacity(0.5),
        disabledTextColor: ZFButtonColors.textButtonDisable,
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        enableFeedback: true,
        height: buttonHeight,
        hoverColor: ZFButtonColors.buttonHover
            .withOpacity(0.7)
            .withGreen(20)
            .withBlue(20)
            .withRed(20),
        highlightColor: ZFButtonColors.highlightColor
            .withOpacity(0.7)
            .withGreen(50)
            .withBlue(20)
            .withRed(20),
        hoverElevation: 10,
        highlightElevation: 10,
        focusElevation: 10,
        focusColor: ZFButtonColors.focusColor
            .withOpacity(0.7)
            .withGreen(20)
            .withBlue(20)
            .withRed(20),
        focusNode: FocusNode(),
        minWidth: buttonWidth,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: ZFBaseColors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(ZFDefaultBorder.defaultBorder),
        ),
        splashColor: ZFButtonColors.splashColor
            .withOpacity(0.7)
            .withGreen(20)
            .withBlue(20)
            .withRed(20),
        padding: const EdgeInsets.all(10),
      ),
    );
  }
}
