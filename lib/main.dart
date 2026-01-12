import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:insta/core/theme/dark_theme.dart';
import 'package:insta/core/theme/light_theme.dart';
import 'package:insta/core/util/get_di.dart';
import 'package:insta/feature/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final language = await init();
  runApp(MyApp(language: language));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> language;
  const MyApp({super.key, required this.language});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: light,
      darkTheme: dark,
      themeMode: ThemeMode.system,
      home: SplashScreen(),
    );
  }
}
