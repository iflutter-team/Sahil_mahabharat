import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/video_screen/video_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatelessWidget {
  final String data;
  const VideoScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    print(data);
    Get.put(VideoController(data));
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.only(bottom: 10),
          children: [
            GetBuilder<VideoController>(
              id: "video",
              builder: (controller) {
                return controller.inLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : YoutubePlayerBuilder(
                        player: YoutubePlayer(
                          controller: controller.controller,
                        ),
                        builder: (context, player) => Column(
                              children: [
                                player,
                              ],
                            ));
              },
            ),
          ],
        )),
      ),
    );
  }
}
