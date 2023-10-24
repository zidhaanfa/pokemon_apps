import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
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
                    InkWell(
                      child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height / 18,
                          margin: EdgeInsets.only(top: 25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.black),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/google-logo.png'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Text(
                                'Sign in with Google',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ))),
                      onTap: () {
// hp                      signInWithGoogle(model)
//                           .then((FirebaseUser user){
//                         model.clearAllModels();
//                         Navigator.of(context).pushNamedAndRemoveUntil
//                           (RouteName.Home, (Route<dynamic> route) => false
//                         );}
//                         ).catchError((e) => print(e));
                        loginController.loginProcess();
                      },
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
                                    loginController
                                        .fireToast2("Privacy Policy Hash Tag");
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
      ),
    );
  }
}
