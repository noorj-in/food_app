import 'package:flutter/material.dart';

final customColors = CustomColors();

class CustomColors {
  static const MaterialColor primarySwatch = MaterialColor(
    0xFFFFFF,
    <int, Color>{
      50: Colors.white10,
      100: Colors.white12,
      200: Colors.white24,
      300: Colors.white30,
      400: Colors.white38,
      500: Color(0xffffffff),
      600: Colors.white54,
      700: Colors.white60,
      800: Colors.white70,
      900: Colors.white70,
    },
  );
  final Color white = const Color(0xFFFFFFFF);
  final Color lightBlack = const Color(0xFF666666);
  final Color hintColor = const Color(0xFF97959D);
  final Color textGreyColor = const Color(0xFF66707A);
  final Color black = const Color(0xFF000000);
  final Color skyBlue = const Color(0xFF876CFE);
  final Color lightGreyLoginSuccess = const Color(0xFF64626A);
  final Color lightRed = const Color(0xFFEFA9A9);
  final Color lightGrey = const Color(0xFFCBCACE);
  final Color blue = const Color(0xFF2980B9);
  final Color lightBlue = const Color(0xFF6DD5FA);

  final List<List<Color>> predefinedGradients = [
    [Color(0xFF876CFE), Color(0xFFC8CAFF)],
    [Color(0xFFFF5733), Color(0xFFFFC300)],
    [Color(0xFF28B463), Color(0xFFDAF7A6)],
    [Color(0xFF2980B9), Color(0xFF6DD5FA)],
    [Color(0xFFF39C12), Color(0xFFFFD700)],
  ];
}
