import 'package:cached_network_image/cached_network_image.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/home_screen/home_screen_controller.dart';
import 'package:mahabharat/screen/video_screen/video_controller.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/color_res.dart';
import 'package:mahabharat/utils/icon_res.dart';

Widget videoScreenBody() {
  double height = Get.height;
  double width = Get.width;
  return GetBuilder<VideoController>(
    id: "video_player",
    builder: (controller) {
      return controller.inLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetRes.bgImage), fit: BoxFit.fill)),
              child: Column(
                children: [
                  ///----------------------------------------------------play video-----------------------------------------------///
                  GetBuilder<VideoController>(
                    id: "video_player",
                    builder: (controller) => Expanded(
                      flex: 3,
                      child: FlickVideoPlayer(
                        flickVideoWithControls: FlickVideoWithControls(
                          textStyle:
                              const TextStyle(fontWeight: FontWeight.bold),
                          controls: FlickPortraitControls(
                            iconSize: height * 0.030,
                            progressBarSettings: FlickProgressBarSettings(
                              height: 2,
                              playedColor: ColorRes.redColor,
                              handleColor: ColorRes.redColor,
                              handleRadius: 6,
                            ),
                          ),
                          videoFit: BoxFit.cover,
                        ),
                        flickManager: controller.flickManager!,
                      ),
                    ),
                  ),

                  ///------------------------------------------------------Video Screen Title----------------------------------------///
                  Container(
                    color: ColorRes.transparentColor.withOpacity(0.6),
                    child: Padding(
                        padding: EdgeInsets.all(height * 0.015),
                        child: GetBuilder<HomeScreenController>(
                          builder: (controllerHome) {
                            return Text(
                              controllerHome.userVideo![controller.indexTitle!].title!,
                              style: TextStyle(
                                  fontSize: height * 0.026,
                                  color: ColorRes.whiteColor,
                                  fontWeight: FontWeight.bold),
                            );
                          },
                        )),
                  ),

                  ///--------------------------------------------------------------Video Screen PlayList---------------------------------------///
                  GetBuilder<HomeScreenController>(
                    builder: (controllerHome) {
                      return Expanded(
                        flex: 5,
                        child: Container(
                            color: ColorRes.transparentColor.withOpacity(0.6),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: controllerHome.userVideo!.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    controller.onTapVideoPlayList(
                                      controllerHome
                                          .userVideo![index].videourl!,
                                      index,
                                    );
                                    if (kDebugMode) {
                                      print("=======================>");
                                    }
                                  },

                                  ///-----------------------------------------------------Full card-----------------------------------------------///
                                  child: Card(
                                    margin: EdgeInsets.only(
                                        top: height * 0.015,
                                        left: width * 0.030,
                                        right: width * 0.030),
                                    shape: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white70),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(height * 0.015),
                                      ),
                                    ),
                                    //  elevation: 20,
                                    color: ColorRes.transparentColor
                                        .withOpacity(0.1),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ///----------------------------------Thum image-------------------------------------------///
                                        SizedBox(
                                          height: height * 0.16,
                                          width: width * 0.48,
                                          child: CachedNetworkImage(
                                            imageUrl: controllerHome
                                                .userVideo![index].imageurl!,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                      height * 0.015),
                                                  topLeft: Radius.circular(
                                                      height * 0.015),
                                                ),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            placeholder: (context, url) =>
                                                Center(
                                              child: SizedBox(
                                                height: height * 0.040,
                                                child:
                                                    const CircularProgressIndicator(
                                                        color: ColorRes
                                                            .whiteColor),
                                              ),
                                            ),
                                            errorWidget: (context, url,
                                                    error) =>
                                                const Icon(IconRes.errorIcon),
                                          ),
                                        ),

                                        ///--------------------------------------title-------------------------------------------------///
                                        Expanded(
                                          child: Container(
                                            height: height * 0.16,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        height * 0.015),
                                                    bottomRight:
                                                        Radius.circular(
                                                            height * 0.015))),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: width * 0.02,
                                                  top: height * 0.0075,
                                                  right: width * 0.009),
                                              child: Text(
                                                  controllerHome
                                                      .userVideo![index].title!,
                                                  style: TextStyle(
                                                      color:
                                                          ColorRes.whiteColor,
                                                      fontSize: height * 0.021,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )),
                      );
                    },
                  )
                ],
              ),
            );
    },
  );
}
