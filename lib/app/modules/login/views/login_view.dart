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
                      width: MediaQuery.of(context).size.width / 2,
                      fit: BoxFit.fitHeight,
                      image: Image.asset(
                        'assets/images/Z2.png',
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
                loginController.isLogin.value == true
                    ? ZFText(
                        text: loginController.currentUser!.displayName ?? '',
                        maxLines: 1,
                        fontType: FontType.bigTitleBold2,
                        textAlignment: MainAxisAlignment.center,
                        colorText: ZFOtherColors.whiteGrey,
                        // colorText: DZOtherColors.white,
                      )
                    : ZFText(
                        text: 'Belum Login',
                        maxLines: 1,
                        fontType: FontType.bigTitleBold2,
                        textAlignment: MainAxisAlignment.center,
                        colorText: ZFOtherColors.whiteGrey,
                        // colorText: DZOtherColors.white,
                      ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: ZFBaseColors.background.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(height: 10),
                      const ZFText(
                        text: 'LOGIN',
                        maxLines: 1,
                        fontType: FontType.bigTitleBold2,
                        textAlignment: MainAxisAlignment.center,
                        colorText: ZFOtherColors.whiteGrey,
                        // colorText: DZOtherColors.white,
                      ),

                      /// EMAIL
                      // ZFTeksFormField(
                      //   controller: controller.emailController,
                      //   labelText: 'Email',
                      //   keyboardType: TextInputType.emailAddress,
                      //   obsecure: false,
                      //   // maxLines: 10,
                      //   prefixIcon: Icons.email,
                      // ),
                      // // Divider(color: Colors.black54, height: 1),
                      // SizedBox(height: 10),

                      // /// PASSWORD
                      // ZFTeksFormField(
                      //   controller: controller.passwordController,
                      //   labelText: 'Password',
                      //   keyboardType: TextInputType.visiblePassword,
                      //   obsecure: controller.isObsecure.value,
                      //   // maxLines: 1,
                      //   prefixIcon: Icons.lock,
                      //   suffixIcon: controller.isObsecure.value
                      //       ? Icons.visibility
                      //       : Icons.visibility_off,
                      //   suffixIconOnPressed: () {
                      //     controller.changeObsecure();
                      //   },
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      loginController.isLogin.value == true
                          ? ListTile(
                              leading: GoogleUserCircleAvatar(
                                  identity: loginController.currentUser!),
                              title: Text(
                                  loginController.currentUser!.displayName ??
                                      ''),
                              subtitle:
                                  Text(loginController.currentUser!.email),
                              trailing: IconButton(
                                icon: Icon(Icons.logout_outlined),
                                onPressed: () async {
                                  await loginController.googleSignIn
                                      .disconnect();
                                  loginController.isLogin.value = false;
                                },
                              ),
                            )
                          : Container(
                              alignment: Alignment.bottomCenter,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    // await loginController.handleSignIn();
                                    final UserCredential? userCredential =
                                        await loginController
                                            .handleGoogleSignIn();
                                    if (userCredential != null) {
                                      print(
                                          "User signed in: ${userCredential.user?.displayName}");
                                    } else {
                                      print("Sign-in failed");
                                    }
                                  },
                                  child: Text('Sign In')),
                            ),
                      const SizedBox(
                        height: 5,
                      ),

                      /// Rich Text & Toast
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 30, left: 30),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: 'By logging in you are agree with our',
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color.fromARGB(255, 232, 231, 231)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' Terms & Conditions ',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Color.fromARGB(255, 212, 0, 0)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Hash tag #tag');
                                      loginController.fireToast2(
                                          "Terms & Conditions Hash Tag");
                                    }),
                              const TextSpan(text: ' and '),
                              TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color:
                                          const Color.fromARGB(255, 212, 0, 0)),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print('Hash tag #tag');
                                      loginController.fireToast2(
                                          "Privacy Policy Hash Tag");
                                    }),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
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
