import 'package:flutter/material.dart';
import 'package:insta/core/theme/custom_theme_colors.dart';
ThemeData dark = ThemeData(
  // ▶️ Core Configuration
  useMaterial3: false,
  fontFamily: 'Roboto',
  brightness: Brightness.dark,
  primaryColorLight: Color(0x1AE9F3FF),
  cardColor: Color(0XFFFFFFFF),
  scaffoldBackgroundColor: Color(0xFF02070E),
  primaryColor: Color(0XFFFCFCFC),
  unselectedWidgetColor: Color(0XFF595959),
  canvasColor: Color(0X2BAFB1B5),

  extensions: <ThemeExtension<CustomThemeColors>>[CustomThemeColors.dark()],

  colorScheme: const ColorScheme.dark(
    secondary: Color(0xffD91A46),
    error: Color(0XFFFF5555),
    inversePrimary: Color(0XFF00AA6D),
    primary: Color(0xff3797EF),
  ).copyWith(surface: const Color(0xff000000)),
);
