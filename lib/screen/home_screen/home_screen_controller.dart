import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/character_screen/character_screen.dart';
import 'package:mahabharat/screen/video_screen/video_screen.dart';
import 'package:mahabharat/services/audio_service/audio_controller_screen.dart';
import 'package:mahabharat/services/firebase_service/firebase_service.dart';
import 'package:mahabharat/services/service_utils/firebase_res.dart';
import 'package:mahabharat/services/service_utils/url_res.dart';
import 'package:share_plus/share_plus.dart';

import '../../json_model/video_model.dart';
import '../setting_screen/setting_screen.dart';

class HomeScreenController extends GetxController {
  String link = '';
  AudioController audioController = Get.find<AudioController>();
  final advancedDrawerController = AdvancedDrawerController();
  List<UserVideo>? userVideo;

  ///--------------------------------------------onInit--------------------------------------------------------------///
  @override
  void onInit() {
    audioController.bgMusic();
    getAllVideo();
    super.onInit();
  }

  ///--------------------------------------------------dispose--------------------------------------------------------------///
  @override
  void dispose() {
    audioController.bgSong.stop();
    super.dispose();
  }

  ///---------------------------------------------get data(Firebase)-----------------------------------------------///
  Future<void> getAllVideo() async {
    userVideo = await FireBaseService.getVideo(FirebaseRes.videoData);
    print('******************');
    update(["listView"]);
  }

  void handleMenuButtonPressed() {
    advancedDrawerController.showDrawer();
  }

  ///---------------------------------watch Video-------------------------------------///
  void watchVideo(int index, int indexTitle) {
    String url = userVideo![index].videourl!;
    print("url video========================================>$url");
    Get.to(
      () => VideoScreen(data: url, index: indexTitle),
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

  ///------------------------------------------Characters Screen------------------------------------///
  void charactersButton() {
    Get.to(() => const CharacterScreen());
  }
}
