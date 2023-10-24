import 'package:flutter/material.dart';

import '../baseData.dart';
import '../config.dart';
import 'ZFText.dart';

class ZFParagraph extends StatelessWidget {
  ZFParagraph({
    Key? key,
    required this.title,
    required this.description,
    this.titletype,
    this.descriptiontype,
    this.mainAxisAlignment,
  }) : super(key: key);

  String title;
  String description;
  FontType? titletype;
  FontType? descriptiontype;
  MainAxisAlignment? mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ZFText(
          text: title,
          maxLines: 2,
          fontType: titletype ?? FontType.titleBold,
          textAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        ),
        ZFText(
          text: description,
          maxLines: 6,
          fontType: descriptiontype ?? FontType.body,
          textAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
        ),
      ],
    );
  }
}
