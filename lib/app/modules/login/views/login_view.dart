import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pokemon_apps/app/modules/home/bindings/home_binding.dart';
import 'package:pokemon_apps/app/modules/home/views/home_view.dart';

import '../../../config/baseData.dart';
import '../../../config/config.dart';
import '../../../config/widget/ZFText.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
      body: Obx(() {
        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image(
                      width: MediaQuery.of(context).size.width / 1.5,
                      fit: BoxFit.fitHeight,
                      image: Image.asset(
                        'assets/images/pokemon_logo.png',
                        width: MediaQuery.of(context).size.width / 2,
                      ).image,
                    ),
                  ),
                ),
                ZFText(
                  text: loginController.currentUser?.displayName ?? '',
                  maxLines: 1,
                  fontType: FontType.bigTitleBold2,
                  textAlignment: MainAxisAlignment.center,
                  colorText: ZFOtherColors.whiteGrey,
                  // colorText: DZOtherColors.white,
                ),
                const SizedBox(height: 40),
                loginController.isLogin.value == true
                    ? ListTile(
                        leading: GoogleUserCircleAvatar(
                            identity: loginController.currentUser!),
                        title: Text(
                            loginController.currentUser!.displayName ?? ''),
                        subtitle: Text(loginController.currentUser!.email),
                        trailing: IconButton(
                          icon: Icon(Icons.logout_outlined),
                          onPressed: () async {
                            await loginController.googleSignIn.disconnect();
                            loginController.isLogin.value = false;
                          },
                        ),
                      )
                    : InkWell(
                        onTap: () async {
                          final UserCredential? userCredential =
                              await loginController.handleGoogleSignIn();
                          if (userCredential != null) {
                            print(
                                "User signed in: ${userCredential.user?.displayName}");
                          } else {
                            print("Sign-in failed");
                          }
                        },
                        child: Container(
                          width: 250,
                          child: Card(
                            color: Colors.white,
                            child: ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image(
                                  width: 40,
                                  fit: BoxFit.fitHeight,
                                  image: Image.asset(
                                    'assets/images/google-logo.png',
                                    width: 40,
                                  ).image,
                                ),
                              ),
                              title: ZFText(
                                text: 'Sign In with Google',
                                maxLines: 1,
                                fontType: FontType.body,
                                textAlignment: MainAxisAlignment.center,
                                colorText: ZFOtherColors.black,
                                // colorText: DZOtherColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
