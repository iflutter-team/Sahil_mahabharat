import 'package:flutter/material.dart';
import 'package:mahabharat/utils/color_res.dart';

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
