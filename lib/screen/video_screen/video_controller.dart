import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/home_screen/home_screen_controller.dart';
import 'package:mahabharat/services/audio_service/audio_controller_screen.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  HomeScreenController homeController = Get.find<HomeScreenController>();
  AudioController audioController = Get.find<AudioController>();
  String? index;
  int? indexTitle;
  bool inLoading = false;
  VideoController(this.index, this.indexTitle);
  late FlickManager flickManager;

  @override
  void onInit() {
    super.onInit();
    flickManager = FlickManager(
      autoPlay: true,
      autoInitialize: true,
      videoPlayerController: VideoPlayerController.network(index!),
    );
    inLoading = true;
    print("index ======================================>$index");
    update(["video"]);
    inLoading = false;
  }

  @override
  void dispose() {
    super.dispose();
    flickManager.dispose();
    audioController.bgMusic();
    index = null;
  }

  @override
  void onClose() {
    super.onClose();
    flickManager.dispose();
    index = null;
    print("===============================>>>> Dispose");
  }

  void playListVideo() {
    flickManager = FlickManager(
      autoPlay: true,
      autoInitialize: true,
      videoPlayerController: VideoPlayerController.network(index!),
    );
    update(["videoScreen"]);
  }

  Future<bool> onTapBack() async {
    Get.back();
    return false;
  }
}
