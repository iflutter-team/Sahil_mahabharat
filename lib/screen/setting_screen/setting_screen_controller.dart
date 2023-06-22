import 'package:get/get.dart';
import 'package:mahabharat/services/audio_service/audio_controller_screen.dart';

class SettingScreenController extends GetxController {
  AudioController audioController = Get.find<AudioController>();
  bool offMusic = false;
  void backToDrawer() {
    Get.back();
  }

  void sound() {
    audioController.bgMusic();
    update(["box"]);
  }

  void songSetting() {}
  void resetSetting() {}
  void shareSetting() {}
}
