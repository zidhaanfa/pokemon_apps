import 'package:flutter/material.dart';

import '../baseData.dart';

class ZFTeksFormField extends StatelessWidget {
  const ZFTeksFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.keyboardType,
    required this.obsecure,
    this.prefixIcon,
    this.suffixIcon,
    this.suffixIconOnPressed,
    this.maxLength,
    this.maxLines,
    this.enabled,
    this.isLabel,
    this.readOnly,
  }) : super(key: key);
  final TextEditingController controller;
  final String labelText;
  final TextInputType? keyboardType;
  final bool obsecure;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? suffixIconOnPressed;
  final int? maxLength;
  final int? maxLines;
  final bool? enabled;
  final bool? isLabel;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled ?? true,
      controller: controller,
      cursorColor: Colors.green,
      keyboardType: keyboardType,
      readOnly: readOnly ?? false,
      obscureText: obsecure,
      maxLength: maxLength,
      style: TextStyle(
        fontFamily: FontFamilyType.primary,
        textBaseline: TextBaseline.alphabetic,
        fontSize: 13,
      ),
      maxLines: obsecure ? 1 : maxLines,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        hintText: labelText,
        hintStyle: TextStyle(
          fontFamily: FontFamilyType.primary,
          textBaseline: TextBaseline.alphabetic,
          fontSize: 13,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                color: ZFOtherColors.grey,
                size: 24,
              )
            : SizedBox(
                width: 5,
                height: 0,
              ),
        suffix: suffixIcon != null
            ? IconButton(
                icon: Icon(
                  suffixIcon,
                  color: ZFOtherColors.red,
                  size: 24,
                ),
                onPressed: suffixIconOnPressed ?? () {},
              )
            : SizedBox(
                width: 15,
                height: 15,
              ),
        floatingLabelStyle: TextStyle(
          color: ZFButtonColors.button,
          fontFamily: FontFamilyType.primary,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ZFBaseColors.primary,
            width: 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ZFBaseColors.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ZFBaseColors.primary,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: ZFBaseColors.primary,
            width: 2,
          ),
        ),
        labelText: isLabel == true ? labelText : null,
        labelStyle: TextStyle(
          fontFamily: FontFamilyType.primary,
          textBaseline: TextBaseline.alphabetic,
          fontSize: 13,
        ),
        focusColor: Color.fromARGB(255, 138, 138, 138),
        filled: true,
        fillColor: Colors.grey.shade100,
        contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      ),
    );
  }
}
