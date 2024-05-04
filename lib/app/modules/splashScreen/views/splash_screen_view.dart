import 'package:flutter/material.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:get/get.dart';

import '../../login/views/login_view.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: const Image(image: AssetImage('assets/images/pokemon_logo.png')),
      splashIconSize: 200,
      nextScreen: const LoginView(),
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Duration(
        milliseconds: 1000,
      ),
      backgroundColor: Color(0xFF0E1F40),
    );
  }
}
