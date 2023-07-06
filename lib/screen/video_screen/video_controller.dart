import 'package:flick_video_player/flick_video_player.dart';
import 'package:get/get.dart';
import 'package:mahabharat/services/audio_service/audio_controller_screen.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  AudioController audioController = Get.find<AudioController>();
  String? videoUrl;
  int? indexTitle;
  bool inLoading = false;
  VideoController(this.videoUrl, this.indexTitle);
  FlickManager? flickManager;

  ///----------------------------------------------onInit--------------------------------------------------------------///
  @override
  void onInit() {
    super.onInit();
    onPlay(videoUrl ?? "");
    audioController.bgSong.stop();
  }

  ///---------------------------------------------dispose--------------------------------------------///
  @override
  void dispose() {
    flickManager!.dispose();
    super.dispose();
  }

  void onPlay(String index) {
    inLoading = true;
    update(["videoScreen"]);
    flickManager = FlickManager(
      autoPlay: true,
      autoInitialize: true,
      videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(index)),
    );
    print("index ======================================>$index");
    inLoading = false;
    update(["videoScreen"]);
  }

  void onTapVideo(String videosUrl, int index) {
    indexTitle = index;
    flickManager!.handleChangeVideo(
      videoChangeDuration: const Duration(microseconds: 100),
      VideoPlayerController.networkUrl(Uri.parse(videosUrl)),
    );
    update(["video_player"]);
  }

  Future<bool> onTapBack() async {
    Get.back();
    return false;
  }
}
