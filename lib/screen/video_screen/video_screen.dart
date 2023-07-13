import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/video_screen/video_controller.dart';
import 'package:mahabharat/screen/video_screen/video_screen_widget.dart';

class VideoScreen extends StatelessWidget {
  final String data;
  final int index;
  const VideoScreen({super.key, required this.data, required this.index});

  @override
  Widget build(BuildContext context) {
    Get.put(VideoController(data, index));
    return GetBuilder<VideoController>(builder: (controller) {
      return WillPopScope(
        onWillPop: () async {
          controller.flickManager!.dispose();
          Get.back();
          return true;
        },
        child: SafeArea(
          child: Scaffold(body: videoScreenBody()),
        ),
      );
    });
  }
}
