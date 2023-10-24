import 'package:flutter/material.dart';

import '../baseData.dart';
import '../config.dart';
import 'ZFAppBar.dart';

class ZFDefaultLayout extends StatelessWidget {
  ZFDefaultLayout({
    Key? key,
    required this.childrenWidget,
    required this.appBarHeight,
    required this.title,
    required this.appBar,
    required this.withBack,
    this.childrenBottom,
    this.titleLabel,
    this.childrenBottomHeight,
    this.floatingActionButton,
    this.childrenActionWidget,
  }) : super(key: key);
  List<Widget> childrenWidget = const <Widget>[];
  double appBarHeight;
  final TitleName title;
  bool appBar;
  String? titleLabel;
  bool withBack;
  List<Widget>? childrenBottom;
  List<Widget>? childrenActionWidget;
  double? childrenBottomHeight;
  Widget? floatingActionButton;
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: childrenWidget,
              ),
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
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
