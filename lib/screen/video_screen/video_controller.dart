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
    audioController.bgSong.stop();
    onPlay(videoUrl ?? "");
    super.onInit();
  }

  ///---------------------------------------------dispose--------------------------------------------///
  @override
  void dispose() {
    flickManager!.dispose();
    super.dispose();
  }

  ///------------------------------------------------------Home Screen Video Play-----------------------------------///
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

  ///--------------------------------------------------------------Play List Video---------------------------------///
  void onTapVideo(String videosUrl, int index) {
    flickManager!.dispose();
    indexTitle = index;
    flickManager!.handleChangeVideo(
      videoChangeDuration: const Duration(microseconds: 100),
      VideoPlayerController.networkUrl(Uri.parse(videosUrl)),
    );
    update(["video_player"]);
  }
}
