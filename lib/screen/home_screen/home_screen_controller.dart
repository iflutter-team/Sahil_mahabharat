import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/character_screen/character_screen.dart';
import 'package:mahabharat/screen/setting_screen/setting_screen.dart';
import 'package:mahabharat/screen/video_screen/video_screen.dart';
import 'package:mahabharat/services/audio_service/audio_controller_screen.dart';
import 'package:mahabharat/services/firebase_service/firebase_res.dart';
import 'package:mahabharat/services/firebase_service/firebase_service.dart';
import 'package:mahabharat/services/url_res.dart';
import 'package:share_plus/share_plus.dart';

import '../../json_model/video_model.dart';

class HomeScreenController extends GetxController {
  String link = '';
  AudioController audioController = Get.find<AudioController>();
  final advancedDrawerController = AdvancedDrawerController();
  List<UserVideo>? userVideo;

  @override
  void onInit() {
    audioController.bgMusic();
    getAllVideo();
    super.onInit();
  }

  Future<void> getAllVideo() async {
    userVideo = await FireBaseService.getVideo(FirebaseRes.videoData);
    print('******************');
    update(["listView"]);
  }

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  ///---------------------------------watch Video-------------------------------------///
  void watchVideo(int index) {
    String url = userVideo![index].videourl!;
    print("url video========================================>$url");
    Get.to(
      () => VideoScreen(
        data: url,
      ),
    );
    audioController.bgSong.stop();
    update(["listView"]);
  }

  ///-----------------------------Share App----------------------------------///
  void shareLink() async {
    await Share.share(UrlRes.sharApp, subject: link);
    update(["share"]);
  }

  ///---------------------------------Tap Setting--------------------------------///
  void goToSettingPage() {
    Get.to(() => const SettingScreen());
  }

  ///------------------------------------video-----------------------------///
  void videoDrawerButton() {
    advancedDrawerController.hideDrawer();
    Get.back();
    update(["videoButton"]);
  }

  void storyButton() {}

  void charactersButton() {
    Get.to(() => const CharacterScreen());
  }
}
