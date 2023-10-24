import 'package:flutter/material.dart';

import '../baseData.dart';
import '../config.dart';
import 'ZFCardLoadingCustom.dart';

class LoadingList extends StatelessWidget {
  const LoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: CardLoadingCustom(
        width: MediaQuery.of(context).size.width,
        height: 20,
      ),
      subtitle: CardLoadingCustom(
        width: MediaQuery.of(context).size.width / 2.8,
        height: 20,
      ),
    );
  }
}
