import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mahabharat/services/audio_service/audio_res.dart';

class AudioController extends GetxController {
  final titleSong = AudioPlayer();
  final bgSong = AudioPlayer();
  Future<void> titleMusic() async {
    await titleSong.setAsset(AudioRes.titleSong);
    if (titleSong.playing) {
      titleSong.stop();
    } else {
      titleSong.play();
      titleSong.setLoopMode(LoopMode.off);
    }
  }

  Future<void> bgMusic() async {
    await bgSong.setAsset(AudioRes.backSong);
    if (bgSong.playing) {
      bgSong.stop();
    } else {
      bgSong.play();
      bgSong.setLoopMode(LoopMode.one);
    }
  }
}
