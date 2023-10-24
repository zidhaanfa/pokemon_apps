import 'package:flutter/material.dart';
import 'package:card_loading/card_loading.dart';
import 'package:get/get.dart';

class ZFLoadingCard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CardLoading(
      height: 10,
      width: 200,
      borderRadius: BorderRadius.all(Radius.circular(10)),
      margin: EdgeInsets.only(bottom: 10),
    );
  }
}
