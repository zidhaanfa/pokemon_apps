import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../baseData.dart';
import '../config.dart';
import 'ZFTextForButton.dart';

class ZFAppBar extends StatelessWidget {
  const ZFAppBar({
    super.key,
    this.title,
    this.childrenWidget,
    required this.withBack,
  });
  final String? title;
  final bool withBack;
  final List<Widget>? childrenWidget;
  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width < ResponsiveGetX.lebar;
    int titleInt;
    return AppBar(
      backgroundColor: ZFBaseColors.primaryContainer, // 1
      elevation: 2, // 2
      automaticallyImplyLeading: false,
      leading: withBack
          ? IconButton(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              highlightColor: const Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                CupertinoIcons.back,
                size: 28,
                color: ZFOtherColors.white,
              ))
          : null,
      centerTitle: true,
      title: ZFTextForButton(
        text: title ?? 'Bisagawe',
        fontType: FontType.titleBold,
        colorText: ZFOtherColors.white,
      ),
      actions: childrenWidget ?? null,
    );
  }
}

class ZFAppBarButton extends StatelessWidget {
  ZFAppBarButton({
    Key? key,
    required this.page,
    required this.titleInt,
    required this.name,
    required this.isActive,
  }) : super(key: key);

  dynamic page;
  int titleInt;
  int isActive;
  String name;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.toNamed(
          page,
        );
      },
      child: Text(name,
          style: TextStyle(
            fontSize: titleInt == isActive
                ? ZFFontSizeCustom.smallTitle
                : ZFFontSizeCustom.body,
            fontWeight:
                titleInt == isActive ? FontWeight.bold : FontWeight.normal,
          )),
    );
  }
}
