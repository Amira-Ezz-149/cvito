import 'package:flutter/material.dart';
import 'constants_color.dart';
Widget orLine({required double? padding}){
  return Row(
    children: <Widget>[
      Expanded(
        child: Divider(
          indent: padding,
          color: kGrayColor189,
          thickness: 3,
          endIndent: 8,
        ),
      ),
      const Text('or'),
      Expanded(
        child: Divider(
          indent: 8,
          color: kGrayColor189,
          thickness: 3,
          endIndent: padding,
        ),
      )
    ],
  );
}