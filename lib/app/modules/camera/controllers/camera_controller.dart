import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CameraController extends GetxController {
  //TODO: Implement CameraController

  final count = 0.obs;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  final isLoading = true.obs;
  final dataQR = ''.obs;

  final isCameraOn = true.obs;
  @override
  void onInit() {
    super.onInit();
    cameraPrepared();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void cameraPrepared() {
    Timer(Duration(seconds: 1), () {
      isLoading(false);
    });
  }

  void increment() => count.value++;
  void onQRViewCreated(QRViewController controller) {
    // setState(() {
    controller = controller;
    controller.scannedDataStream.listen((scanData) {
      // Data kode QR yang dipindai
      print(scanData);
      result = scanData;
      processQRCode(scanData);
      // Tindakan yang ingin Anda lakukan dengan data tersebut
    });
    // });
  }

  void toggleCamera() {
    isCameraOn.value = !isCameraOn.value;
  }

  void processQRCode(Barcode barcode) {
    String qrCode = barcode.code!;
    print(qrCode);
    dataQR.value = qrCode;
    // Future.delayed(const Duration(seconds: 2), () {
    //   isLoading(false);
    //   Get.back();
    // });
  }

  Widget buildResult() => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white38),
        child: Text(
          result != null ? 'Hasil : ${result!.code}' : 'Scan Qr Code!',
          maxLines: 3,
        ),
      );
  Widget buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 60,
          borderWidth: 10,
        ),
        onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
      );
  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}
