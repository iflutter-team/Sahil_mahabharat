import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:mahabharat/services/audio_service/audio_controller_screen.dart';

import '../home_screen/home_screen.dart';

class SplashScreenController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AudioController audioController = Get.put(AudioController());

  ///-------------------------------AnimationController--------------------------------///
  late final AnimationController controller = AnimationController(
    duration: const Duration(
      seconds: 5,
    ),
    vsync: this,
  )..repeat();
  final Tween<double> tween = Tween<double>(begin: 0, end: 1);

  ///------------------------------------onInit--------------------------------------///
  @override
  Future<void> onInit() async {
    controller;
    tween;
    await audioController.titleMusic();
    Timer(const Duration(seconds: 6), () {
      Get.off(() => const HomeScreen());
      audioController.titleSong.stop();
    });
    super.onInit();
  }
}
