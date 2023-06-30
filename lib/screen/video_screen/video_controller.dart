import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/home_screen/home_screen_controller.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  HomeScreenController homeController = Get.find<HomeScreenController>();
  String? index;
  bool inLoading = false;
  VideoController(this.index);
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
    print("======================================>$index");
    update(["video"]);
    inLoading = false;
  }

  @override
  void dispose() {
    super.dispose();
    flickManager.dispose();
    index = null;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    flickManager.dispose();
    index = null;
    print("===============================>>>> Dispose");
  }

  Future<bool> onTapBack() async {
    Get.back();
    return false;
  }
}
