import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/video_screen/video_controller.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/color_res.dart';

class VideoScreen extends StatelessWidget {
  final String data;
  const VideoScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
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
                    : Container(
                        height: Get.height,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(AssetRes.bgImage),
                                fit: BoxFit.fill)),
                        child: Column(
                          children: [
                            FlickVideoPlayer(
                                flickManager: controller.flickManager),
                            Expanded(
                              child: Container(
                                height: Get.height,
                                width: Get.width,
                                color:
                                    ColorRes.transparentColor.withOpacity(0.5),
                                child: const Text("mahabharat"),
                              ),
                            )
                          ],
                        ),
                      );
              },
            ),
          ],
        )),
      ),
    );
  }
}
