import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/common_file/home_screen_common/drawer_button_common.dart';
import 'package:mahabharat/common_file/home_screen_common/listTile_divider_common.dart';
import 'package:mahabharat/services/version_res.dart';
import 'package:mahabharat/utils/color_res.dart';
import 'package:mahabharat/utils/icon_res.dart';
import 'package:mahabharat/utils/string_res.dart';

Widget drawerHomePage() {
  return Column(
    children: [
      Container(
        height: Get.height * 0.15,
        width: Get.width,
        color: ColorRes.redColor.shade700,
        child: Center(
          child: BorderedText(
            strokeWidth: 4.5,
            strokeColor: ColorRes.orangeAssentColor,
            child: Text(
              StringRes.mahabharatText,
              style: TextStyle(
                  fontSize: Get.height * 0.065,
                  color: ColorRes.greenColor.shade900,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
      Expanded(
        child: Container(
          color: Colors.transparent.withOpacity(0.65),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              videoButton(),
              dividerCommon(),
              listTileCommon(IconRes.storyIcon, StringRes.storyText),
              dividerCommon(),
              characterButton(),
              dividerCommon(),
              settingButton(),
              dividerCommon(),
              shareAppButton(),
              dividerCommon(),
              rateAppButton(),
              dividerCommon(),
              moreApp(),
              dividerCommon(),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(
                  VersionRes.version,
                  style: TextStyle(color: ColorRes.greyColor),
                ),
              )
            ],
          ),
        ),
      )
    ],
  );
}
