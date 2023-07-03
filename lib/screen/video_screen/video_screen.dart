import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/home_screen/home_screen_controller.dart';
import 'package:mahabharat/screen/video_screen/video_controller.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/color_res.dart';

class VideoScreen extends StatelessWidget {
  final String data;
  final int index;

  VideoScreen({super.key, required this.data, required this.index});

  HomeScreenController homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    Get.put(VideoController(data, index));
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.only(bottom: 10),
            children: [
              GetBuilder<VideoController>(
                id: "videoScreen",
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
                              SizedBox(
                                width: Get.width,
                                height: Get.height * 0.25,
                                child: FlickVideoPlayer(
                                    flickManager: controller.flickManager),
                              ),
                              Container(
                                color:
                                    ColorRes.transparentColor.withOpacity(0.6),
                                child: Padding(
                                  padding: EdgeInsets.all(Get.height * 0.015),
                                  child: Text(
                                    homeScreenController
                                        .userVideo![controller.indexTitle!]
                                        .title!,
                                    style: TextStyle(
                                        fontSize: Get.height * 0.026,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    color: ColorRes.transparentColor
                                        .withOpacity(0.6),
                                    child: ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: homeScreenController
                                          .userVideo!.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            homeScreenController.watchVideo(
                                                index, index);
                                            print(
                                                "====================================================================================================>");
                                          },
                                          child: Card(
                                            margin: EdgeInsets.only(
                                                top: Get.height * 0.015,
                                                left: Get.width * 0.030,
                                                right: Get.width * 0.030),
                                            shape: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.white70),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    Get.height * 0.015),
                                              ),
                                            ),
                                            elevation: 20,
                                            color: ColorRes.transparentColor
                                                .withOpacity(0.1),
                                            child: Row(
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: homeScreenController
                                                      .userVideo![index]
                                                      .imageurl!,
                                                  imageBuilder: (context,
                                                          imageProvider) =>
                                                      Container(
                                                    height: Get.height * 0.16,
                                                    width: Get.width * 0.48,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                Get.height *
                                                                    0.015),
                                                        topLeft:
                                                            Radius.circular(
                                                                Get.height *
                                                                    0.015),
                                                      ),
                                                      image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.fill),
                                                    ),
                                                  ),
                                                  placeholder: (context, url) =>
                                                      const Center(
                                                          child: CircularProgressIndicator(
                                                              color: ColorRes
                                                                  .whiteColor)),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: Get.height * 0.16,
                                                    decoration: BoxDecoration(
                                                        color: ColorRes
                                                            .black54Color,
                                                        borderRadius: BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    Get.height *
                                                                        0.015),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    Get.height *
                                                                        0.015))),
                                                    child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left:
                                                              Get.width * 0.02,
                                                          top: Get.height *
                                                              0.0075,
                                                          right: Get.width *
                                                              0.009),
                                                      child: Text(
                                                          homeScreenController
                                                              .userVideo![index]
                                                              .title!,
                                                          style: TextStyle(
                                                              color: ColorRes
                                                                  .whiteColor,
                                                              fontSize:
                                                                  Get.height *
                                                                      0.021,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )),
                              )
                            ],
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
