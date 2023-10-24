import 'package:flutter/material.dart';

import '../baseData.dart';
import '../config.dart';
import 'ZFText.dart';

class ZFDateForm extends StatelessWidget {
  ZFDateForm({
    Key? key,
    required this.name,
    required this.height,
    required this.width,
  }) : super(key: key);

  String name;
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ZFText(
        text: name,
        maxLines: 3,
        fontType: FontType.body,
        textAlignment: MainAxisAlignment.center,
        // colorText: ZFOtherColors.white,
        icon: Icons.calendar_today,
        startIcon: false,
        colorIcon: ZFOtherColors.black,
      ),
    );
  }
}
