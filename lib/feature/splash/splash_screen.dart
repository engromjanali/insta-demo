import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import 'package:insta/core/helper/public_method.dart';
import 'package:insta/feature/auth/screen/login_in_screen.dart';
import 'package:insta/feature/root/root_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    callBackFunction((){
      route();
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(child: Text("Loading...")),
    );
  }

  void route()async{
   await Future.delayed(Duration(milliseconds: 500));
    Get.off(()=>LoginScreen());
  }
}