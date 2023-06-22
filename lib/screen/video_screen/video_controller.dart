import 'dart:ui';

import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  String? index;
  late YoutubePlayerController controller;
  bool inLoading = false;

  VideoController(this.index);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    inLoading = true;
    print("======================================>$index");
    late String videoId;
    videoId = YoutubePlayer.convertUrlToId(index!)!;
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        hideThumbnail: false,
        loop: true,
        autoPlay: true,
        hideControls: false,
      ),
    );
    YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
        onReady: () {
          controller.addListener(listeners as VoidCallback);
        });
    inLoading = false;
    update(["video"]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    index = null;
    print("===============================>>>> Dispose");
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    controller.dispose();
    index = null;
    print("===============================>>>> Dispose");
  }

  Future<bool> onTapBack() async {
    Get.back();
    return false;
  }
}
