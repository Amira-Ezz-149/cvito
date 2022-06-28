import 'package:flutter/material.dart';
Widget text(
    {required String? text,
      required Color? colors,
      required double? size,
      TextAlign? align,
      double? spacing,
      required FontWeight? fontWeight}) {
  return Text(
    text!,
    textAlign: align,
    style: TextStyle(
        fontStyle: FontStyle.normal,
        letterSpacing: spacing,
        fontFamily: "Roboto",
        fontWeight: fontWeight,
        fontSize: size,
        color: colors),
  );
}