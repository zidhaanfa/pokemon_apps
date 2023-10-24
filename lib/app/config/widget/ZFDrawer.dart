import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../baseData.dart';
import '../config.dart';

class ZFDrawer extends StatelessWidget {
  ZFDrawer({super.key, required this.title});

  final TitleName title;

  @override
  Widget build(BuildContext context) {
    int titleInt;
    switch (title) {
      case TitleName.login:
        titleInt = 0;
        break;
      case TitleName.home:
        titleInt = 1;
        break;
      default:
        titleInt = 0;
    }
    return Drawer(
      width: 200,
      elevation: 2,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          ZFDrawerButton(
            page: '/',
            titleInt: titleInt,
            isActive: 0,
            name: "Home",
            icon: Icons.home,
          ),
          ZFDrawerButton(
            page: '/projects',
            titleInt: titleInt,
            isActive: 1,
            name: "Projects",
            icon: Icons.folder,
          ),
          ZFDrawerButton(
            page: '/activity',
            titleInt: titleInt,
            isActive: 2,
            name: "Activity",
            icon: Icons.checklist,
          ),
        ],
      ),
    );
  }
}

class ZFDrawerButton extends StatelessWidget {
  ZFDrawerButton({
    Key? key,
    required this.page,
    required this.titleInt,
    required this.name,
    required this.isActive,
    required this.icon,
  }) : super(key: key);

  dynamic page;
  int titleInt;
  int isActive;
  String name;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: titleInt == isActive
            ? ZFTextColors.textWhite
            : Colors.white.withOpacity(0.5),
      ),
      title: Text(name,
          style: TextStyle(
            color: titleInt == isActive
                ? ZFTextColors.textWhite
                : Colors.white.withOpacity(0.5),
            fontSize: 15,
            fontWeight:
                titleInt == isActive ? FontWeight.bold : FontWeight.normal,
          )),
      selectedColor: ZFButtonColors.button,
      autofocus: titleInt == isActive ? true : false,
      mouseCursor: SystemMouseCursors.click,
      hoverColor: ZFButtonColors.button,
      focusColor: ZFBaseColors.card,
      enabled: true,
      enableFeedback: titleInt == isActive ? true : false,
      onTap: () {
        // Update the state of the app.
        // ...
        Get.toNamed(
          page,
        );
      },
    );
  }
}
