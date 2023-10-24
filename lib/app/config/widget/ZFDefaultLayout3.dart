import 'package:flutter/material.dart';

class ZFDefaultLayout3 extends StatelessWidget {
  ZFDefaultLayout3({
    Key? key,
    required this.childrenWidget,
  }) : super(key: key);
  List<Widget> childrenWidget = const <Widget>[];
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 1280,
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: childrenWidget,
            ),
          ),
        ),
      ),
    );
  }
}
