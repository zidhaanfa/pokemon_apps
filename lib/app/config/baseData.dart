import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FontFamilyType {
  FontFamilyType._();
  static String? primary = GoogleFonts.plusJakartaSans().fontFamily;
}

class ZFFontSizeCustom {
  ZFFontSizeCustom._();
  static double bigTitle1 = 22;
  static double bigTitle2 = 20;
  static double bigTitle = 18;
  static double title = 16;
  static double smallTitle = 14;
  static double subtitle = 12;
  static double body = 12;
  static double caption = 10;

  static double h1 = 22;
  static double h2 = 20;
  static double h3 = 18;
  static double h4 = 16;
  static double h5 = 14;
  static double h6 = 12;
  static double h7 = 10;
}

class ResponsiveGetX {
  static int lebar = 700;
  final bool lebar1 = MediaQuery.of(Get.context!).size.width <= 600;
  static bool mobile = Get.width <= 480;
  static bool tablet = Get.width <= 800;
  static bool desktop = Get.width <= 1000;

  late int responsiveNumber;
}

class ZFBaseColors {
  ZFBaseColors._();
  static Color gradient1 = Color(0xFF28844D);
  static Color gradient2 = Color(0xFF077091);
  static Color primary = const Color(0xFF8D9440);
  static Color primaryContainer = Color(0xFF707532);
  static Color secondary = Color(0xFFBFC39B);
  static Color secondaryContainer = Color(0xFF999C7C);
  static Color tertiary = Color(0xFFC78D20);
  static Color tertiaryContainer = Color(0xFF9B6D18);
  static Color error = const Color(0xffb00020);
  static Color success = const Color(0xff4caf50);
  static Color info = const Color(0xff2196f3);
  static Color warning = const Color(0xffff9800);
  static Color transparent = Colors.transparent;
  static Color background = Color(0xFF616247);
  static Color appBarColor = Color(0xff609966);
  static Color blackBackground = const Color(0xff000000);
  static Color whiteBackground = const Color.fromARGB(255, 1, 12, 19);
  static Color footerBackground = const Color.fromARGB(255, 11, 11, 11);
  static Color card = Color.fromARGB(255, 255, 255, 255);
}

class ZFButtonColors {
  ZFButtonColors._();
  static Color textLink = Color.fromARGB(255, 63, 108, 175);
  static Color textButton = ZFTextColors.textWhite;
  static Color textButtonRev = ZFTextColors.textBlack;
  static Color textButtonDisable = const Color(0xff000000).withOpacity(0.5);
  static Color button = ZFBaseColors.primary;
  static Color buttonDisable = Color.fromARGB(134, 87, 124, 92);
  static Color buttonHover = ZFBaseColors.primary.withOpacity(0.5);
  static Color highlightColor = Color.fromARGB(255, 244, 244, 244);
  static Color focusColor = Color.fromARGB(255, 219, 222, 220);
  static Color splashColor = Color.fromARGB(255, 208, 208, 208);
}

class ZFTextColors {
  ZFTextColors._();
  static Color textBlack = const Color(0xff000000);
  static Color textBlackSec = const Color(0xff000000).withOpacity(0.5);
  static Color textWhiteSec = const Color(0xffffffff).withOpacity(0.5);
  static Color textWhite = const Color(0xffffffff);
}

class ZFDefaultBorder {
  ZFDefaultBorder._();
  static double defaultBorder = 20;
  static Color borderColor = ZFButtonColors.button;
}

class ZFGradientColor {
  ZFGradientColor._();
  static List<Color> card1 = [
    ZFBaseColors.gradient1,
    ZFBaseColors.gradient2,
  ];
}

class ZFOtherColors {
  ZFOtherColors._();
  static const Color silver = Color(0xFFC0C0C0);
  static const Color white = Color(0xFFFFFFFF);
  static const Color beige = Color(0xFFA8A878);
  static const Color black = Color.fromARGB(255, 0, 0, 0);
  static const Color blue = Color(0xFF429BED);
  static const Color brown = Color(0xFFB1736C);
  static const Color darkBrown = Color(0xD0795548);
  static const Color darkGrey = Color(0xFF303943);
  static const Color darkRed = Color.fromARGB(255, 166, 39, 39);
  static const Color darkGreen = Color(0xFF4E8234);
  static const Color grey = Color(0x64303943);
  static const Color indigo = Color(0xFF6C79DB);
  static const Color lightBlue = Color(0xFF7AC7FF);
  static const Color lightBrown = Color(0xFFCA8179);
  static const Color whiteGrey = Color(0xFFFDFDFD);
  static const Color lightCyan = Color(0xFF98D8D8);
  static const Color lightGreen = Color(0xFF78C850);
  static const Color lighterGrey = Color(0xFFF4F5F4);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color lightPink = Color(0xFFEE99AC);
  static const Color lightPurple = Color(0xFF9F5BBA);
  static const Color lightRed = Color(0xFFFB6C6C);
  static const Color lightTeal = Color(0xFF48D0B0);
  static const Color lightYellow = Color(0xFFFFCE4B);
  static const Color lime = Color(0xFFA8B820);
  static const Color green = Color.fromARGB(255, 76, 175, 80);
  static const Color lilac = Color(0xFFA890F0);
  static const Color pink = Color(0xFFF85888);
  static const Color purple = Color(0xFF7C538C);
  static const Color red = Color.fromARGB(255, 232, 42, 21);
  static const Color teal = Color(0xFF4FC1A6);
  static const Color yellow = Color(0xFFF6C747);
  static const Color semiGrey = Color(0xFFbababa);
  static const Color violet = Color(0xD07038F8);
}
