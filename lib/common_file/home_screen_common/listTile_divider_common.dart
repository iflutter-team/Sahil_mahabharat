import 'package:flutter/material.dart';
import 'package:mahabharat/utils/color_res.dart';

Widget listTileCommon(IconData icon, String text) {
  return ListTile(
    leading: Icon(
      icon,
      color: ColorRes.whiteColor,
    ),
    title: Text(
      text,
      style: const TextStyle(color: ColorRes.whiteColor),
    ),
  );
}

///------------------------------------Divider Common----------------------------///
Widget dividerCommon() {
  return Divider(color: Colors.blueGrey.shade300);
}

Widget textWidgetTitleCommon(String text, [double size = 18]) {
  return Text(
    text,
    style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: ColorRes.orangeAssentColor.shade100),
  );
}

Widget textWidgetSubTitleCommon(String text) {
  return Text(text, style: const TextStyle(color: ColorRes.orangeColor));
}

Widget verticalSize(double height) {
  return SizedBox(height: height);
}

Widget horizontalSize(double width) {
  return SizedBox(width: width);
}
