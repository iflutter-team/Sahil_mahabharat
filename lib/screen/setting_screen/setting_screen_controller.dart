import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:mahabharat/services/audio_service/audio_controller_screen.dart';

class SettingScreenController extends GetxController {
  AudioController audioController = Get.find<AudioController>();
  final advancedDrawerController = AdvancedDrawerController();
  bool offMusic = false;

  @override
  void onInit() {
    audioController.bgMusic();
    super.onInit();
  }

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  void sound() {
    audioController.bgMusic();
    update(["box"]);
  }

  void songSetting() {}
  void resetSetting() {}
  void shareSetting() {}
}
