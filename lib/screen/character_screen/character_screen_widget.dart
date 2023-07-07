import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:get/get.dart';
import 'package:mahabharat/screen/character_screen/character_controller.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/characters_res.dart';
import 'package:mahabharat/utils/color_res.dart';
import 'package:mahabharat/utils/icon_res.dart';
import 'package:mahabharat/utils/string_res.dart';

///-------------------------------------------------Character Screen AppBar---------------------------------------------///
AppBar characterScreenAppBar = AppBar(
  bottom: const PreferredSize(preferredSize: Size(0, 8), child: SizedBox()),
  centerTitle: true,
  backgroundColor: ColorRes.redColor.shade700,
  title: Padding(
    padding: EdgeInsets.only(top: Get.height * 0.010),
    child: Text(
      StringRes.characterText,
      style: TextStyle(fontSize: Get.width * 0.070),
    ),
  ),
  leading: GetBuilder<CharacterController>(
    builder: (controller) {
      return IconButton(
        onPressed: () => controller.handleMenuButtonPressed(),
        icon: ValueListenableBuilder<AdvancedDrawerValue>(
          valueListenable: controller.advancedDrawerController,
          builder: (_, value, __) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: Icon(
                value.visible ? IconRes.clearIcon : IconRes.menuIcon,
                key: ValueKey<bool>(value.visible),
                size: Get.height * 0.035,
              ),
            );
          },
        ),
      );
    },
  ),
);

///---------------------------------------------Character Screen Body-----------------------------------------------------///
Widget characterScreenBody() {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetRes.bgImage), fit: BoxFit.fill)),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.050),

      ///---------------------------------------ListView------------------------------///
      child: ListView.builder(
        itemCount: CharacterRes.character.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.only(top: Get.height * 0.015),
            color: ColorRes.transparentColor.withOpacity(0.3),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///-------------------------------------sort character ----------------------------------------------///
                Container(
                  width: Get.width * 0.9,
                  height: Get.height * 0.050,
                  decoration: BoxDecoration(
                      color: ColorRes.orangeAssentColor.shade700,
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Center(
                      child: Text(
                    CharacterRes.char[index],
                    style: TextStyle(
                        fontSize: Get.width * 0.070,
                        fontWeight: FontWeight.bold),
                  )),
                ),

                ///--------------------------------------------Character Details----------------------------------------------///
                SizedBox(
                  height: Get.height * 0.25,
                  width: Get.width * 0.7,
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: CharacterRes.character[index].length,
                    itemBuilder: (context, innerIndex) {
                      return ListTile(
                        leading: const Text(
                          "📀",
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(
                          CharacterRes.character[index][innerIndex].toString(),
                          style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: ColorRes.whiteColor),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    ),
  );
}
