import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../baseData.dart';
import '../config.dart';
import 'ZFAppBar.dart';

class ZFDefaultLayoutNoBar extends StatelessWidget {
  ZFDefaultLayoutNoBar({
    Key? key,
    required this.childrenWidget,
    required this.appBarHeight,
    required this.title,
    required this.appBar,
    required this.withBack,
    this.childrenBottom,
    this.titleLabel,
    this.childrenBottomHeight,
    this.childrenActionWidget,
    this.body,
  }) : super(key: key);
  List<Widget> childrenWidget = const <Widget>[];
  double appBarHeight;
  final TitleName title;
  bool appBar;
  String? titleLabel;
  bool withBack;
  List<Widget>? childrenBottom;
  double? childrenBottomHeight;
  List<Widget>? childrenActionWidget;
  Widget? body;
  @override
  Widget build(BuildContext context) {
    final lebar = MediaQuery.of(context).size.width < ResponsiveGetX.lebar;

    return ConstrainedBox(
      constraints: const BoxConstraints(
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
                  childrenWidget: childrenActionWidget,
                  withBack: withBack,
                  title: titleLabel ?? 'Bisagawe.com',
                ),
              ),
        // endDrawer: appBar == false
        //     ? null
        //     : lebar
        //         ? ZFDrawer(
        //             title: title,
        //           )
        //         : null,
        body: body ?? SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: childrenWidget,
            ),
          ),
        ),
        bottomNavigationBar: childrenBottom != null
            ? Container(
                padding: const EdgeInsets.all(8),
                height: childrenBottomHeight ?? 100,
                child: Column(
                  children: childrenBottom!,
                ),
              )
            : null,
      ),
    );
  }
}
