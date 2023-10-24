import 'package:flutter/material.dart';

import '../baseData.dart';
import '../config.dart';

class ZFIconButton2 extends StatelessWidget {
  ZFIconButton2({
    Key? key,
    required this.suffixIcon,
    this.suffixIconOnPressed,
    required this.height,
    required this.width,
  }) : super(key: key);
  IconData suffixIcon;
  Function()? suffixIconOnPressed;
  double height;
  double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: Color.fromARGB(255, 138, 138, 138),
        ),
        color: Colors.white,
      ),
      child: IconButton(
        icon: Icon(
          suffixIcon,
          color: ZFOtherColors.red,
          size: 24,
        ),
        onPressed: suffixIconOnPressed ?? () {},
      ),
    );
  }
}
