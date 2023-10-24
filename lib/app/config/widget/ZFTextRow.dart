import 'package:flutter/material.dart';

import '../config.dart';
import 'ZFText.dart';

class ZFTextRow extends StatelessWidget {
  const ZFTextRow({
    Key? key,
    required this.title,
    required this.description,
    this.titletype,
    this.descriptiontype,
    this.mainAxisAlignmentFirst,
    this.mainAxisAlignmentSecond,
    this.widthFirst,
    this.widthSecond,
    this.heightFirst,
    this.heightSecond,
  }) : super(key: key);

  final String title;
  final String description;
  final FontType? titletype;
  final FontType? descriptiontype;
  final MainAxisAlignment? mainAxisAlignmentFirst;
  final MainAxisAlignment? mainAxisAlignmentSecond;
  final double? widthFirst;
  final double? widthSecond;
  final double? heightFirst;
  final double? heightSecond;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: widthFirst ?? 100,
          height: heightFirst,
          child: ZFText(
            text: title,
            maxLines: 2,
            fontType: titletype ?? FontType.titleBold,
            textAlignment: mainAxisAlignmentFirst ?? MainAxisAlignment.start,
          ),
        ),
        Container(
          width: 20,
          // height: heightSecond,
          child: ZFText(
            text: ":",
            maxLines: 1,
            fontType: titletype ?? FontType.body,
            textAlignment: MainAxisAlignment.end,
          ),
        ),
        Container(
          width: widthSecond ?? 200,
          height: heightSecond,
          child: ZFText(
            text: description,
            maxLines: 6,
            fontType: descriptiontype ?? FontType.body,
            textAlignment: mainAxisAlignmentSecond ?? MainAxisAlignment.start,
          ),
        ),
      ],
    );
  }
}
