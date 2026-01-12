import 'package:flutter/material.dart';
import 'custom_theme_colors.dart';

ThemeData light = ThemeData(
  useMaterial3: false,
  fontFamily: 'Roboto',
  brightness: Brightness.light,
  primaryColorLight: Color(0xFFE9F3FF),
  cardColor: Color(0XFFFFFFFF),
  scaffoldBackgroundColor: Color(0XFFFCFCFC),

  primaryColor: Color(0xff1C1E20),
  unselectedWidgetColor: Color(0xff595959),
  canvasColor: Color(0x2bAFB1B5),

  extensions: <ThemeExtension<CustomThemeColors>>[CustomThemeColors.light()],
  
  colorScheme: const ColorScheme.light(
    primary: Color(0XFF1455AC),
    secondary: Color(0XFFF58300),
    error: Color(0XFFFF5555),
    inversePrimary: Color(0XFF00AA6D),
  ).copyWith(surface: const Color(0xffffffff)),
);
