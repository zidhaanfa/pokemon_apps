import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../controllers/camera_controller.dart';

class CameraView extends GetView<CameraController> {
  const CameraView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CameraController cameraController = Get.put(CameraController());
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('QR Code Scanner'),
          centerTitle: true,
        ),
        body: cameraController.isLoading.value == true
            ? Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text(
                    cameraController.dataQR.value,
                  ),
                  cameraController.buildQrView(context),
                  Positioned(bottom: 80, child: controller.buildResult()),
                ],
              ),
      );
    });
  }
}
