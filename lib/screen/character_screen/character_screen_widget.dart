import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mahabharat/utils/asset_res.dart';
import 'package:mahabharat/utils/characters_res.dart';
import 'package:mahabharat/utils/color_res.dart';
import 'package:mahabharat/utils/icon_res.dart';
import 'package:mahabharat/utils/string_res.dart';

AppBar characterScreenAppBar = AppBar(
  centerTitle: true,
  backgroundColor: ColorRes.redColor,
  title: const Text(StringRes.characterText),
  leading: IconButton(
      onPressed: () => Get.back(), icon: const Icon(IconRes.menuIcon)),
);

Widget characterScreenBody() {
  return Container(
    decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(AssetRes.bgImage), fit: BoxFit.fill)),
    child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: ListView.builder(
          itemCount: CharacterRes.char.length,
          itemBuilder: (context, index) {
            return Card(
              color: ColorRes.transparentColor.withOpacity(0.3),
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///-------------------------------------orange----------------------------------------------///
                  Container(
                    width: Get.width * 0.9,
                    height: 40,
                    decoration: BoxDecoration(
                        color: ColorRes.orangeAssentColor.shade700,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Center(
                        child: Text(
                      CharacterRes.character[index].keys.toString(),
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    )),
                  ),

                  ///--------------------------------------------last----------------------------------------------///
                  ListTile(
                    leading:
                        const Icon(Icons.circle, size: 20, color: Colors.black),
                    title: SingleChildScrollView(
                      child: Text(
                        CharacterRes.character[index].toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        )),
  );
}
