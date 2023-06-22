import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/home_screen/video_data.dart';
import 'package:mahabharat/screen/setting_screen/setting_screen.dart';
import 'package:mahabharat/screen/video_screen/video_screen.dart';
import 'package:mahabharat/services/audio_service/audio_controller_screen.dart';
import 'package:mahabharat/services/url_res.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreenController extends GetxController {
  String link = '';

  AudioController audioController = Get.find<AudioController>();
  final advancedDrawerController = AdvancedDrawerController();
  @override
  void onInit() {
    audioController.bgMusic();
    super.onInit();
  }

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  ///---------------------------------watch Video-------------------------------------///
  void watchVideo(int index) {
    String url = VideoData.data[index]["url"];
    print(url);
    Get.to(
      () => VideoScreen(
        data: url,
      ),
    );
    audioController.bgSong.stop();
  }

  ///-----------------------------Share App----------------------------------///
  void shareLink() async {
    await Share.share(UrlRes.sharApp, subject: link);
    update(["share"]);
  }

  ///---------------------------------Tap Setting--------------------------------///
  void goToSettingPage() {
    Get.to(() => const SettingScreen());
    audioController.bgSong.stop();
  }

  ///------------------------------------video-----------------------------///
  void videoDrawerButton() {
    Get.back();
    update(["videoButton"]);
  }

  void storyButton() {}
  void characters() {}
}
