import '/app/config/baseData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ZFCardLoadingCustom.dart';

class LoadingProduct extends StatelessWidget {
  const LoadingProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: ZFOtherColors.white,
        border: Border.all(
          color: ZFOtherColors.silver.withOpacity(0.2),
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        boxShadow: [
          BoxShadow(
            color: ZFOtherColors.silver.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: MediaQuery.of(context).size.width,
            child: CardLoadingCustom(
              height: 100,
              width: MediaQuery.of(Get.context!).size.width,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 30,
            child: CardLoadingCustom(
              height: 20,
              width: MediaQuery.of(Get.context!).size.width,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CardLoadingCustom(
                  height: 20,
                  width: MediaQuery.of(Get.context!).size.width / 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
