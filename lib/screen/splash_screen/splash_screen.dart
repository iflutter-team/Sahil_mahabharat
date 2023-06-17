import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/splash_screen/splash_screen_controller.dart';
import 'package:mahabharat/screen/splash_screen/splash_screen_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(body: splashScreenBody());
  }
}
