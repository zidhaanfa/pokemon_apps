// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../home/bindings/home_binding.dart';
import '../../home/controllers/home_controller.dart';
import '../../home/views/home_view.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  SharedPreferences? prefs;

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  TextEditingController userIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var isLogin = false.obs;
  final form = GlobalKey<FormState>();
  final count = 0.obs;
  final isObsecure = true.obs;
  var isDataLoading = false.obs;
  final userLoginAutoValidate = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
  void changeObsecure() {
    isObsecure.value = !isObsecure.value;
  }

  void fireToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void fireToast2(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green.shade900,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void loginProcess() async {
    Get.to(() => const HomeView(), binding: BindingsBuilder(() {
      Get.put(HomeBinding());
      Get.put(HomeController());
      // Get.lazyReplace(() => HomeController());
    }));
  }
}
