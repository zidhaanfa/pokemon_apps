import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../baseData.dart';
import '../config.dart';
import 'ZFAppBar.dart';
import 'ZFDrawer.dart';

class ZFDefaultLayoutPDF extends StatelessWidget {
  ZFDefaultLayoutPDF({
    Key? key,
    required this.appBarHeight,
    required this.title,
    required this.appBar,
    required this.withBack,
    required this.body,
    this.titleLabel,
  }) : super(key: key);
  double appBarHeight;
  final TitleName title;
  bool appBar;
  String? titleLabel;
  bool withBack;
  Widget body;
  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width < ResponsiveGetX.lebar;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 1280,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: appBar == false
            ? null
            : PreferredSize(
                preferredSize: Size.fromHeight(appBarHeight),
                child: ZFAppBar(
                  withBack: withBack,
                  title: titleLabel ?? 'Bisagawe.com',
                ),
              ),
        body: body,
      ),
    );
  }
}
