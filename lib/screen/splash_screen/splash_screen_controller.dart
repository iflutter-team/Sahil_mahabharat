import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/home_screen/home_screen.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(
      seconds: 10,
    ),
    vsync: this,
  )..repeat();

  final Tween<double> tween = Tween<double>(begin: 0, end: 1);
  @override
  void onInit() {
    controller;
    tween;
    Timer(const Duration(seconds: 10), () {
      Get.off(() => const HomeScreen());
    });
    super.onInit();
  }
}
