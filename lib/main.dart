import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/splash_screen/splash_screen.dart';

void main() {
  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
  ));
}
