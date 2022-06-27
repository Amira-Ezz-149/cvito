import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

Widget buildText(String text) {
  return ReadMoreText(
    text,
    trimCollapsedText: 'see more',
    trimExpandedText: 'see less',
    trimLength: 100,
    trimMode: TrimMode.Length,
    delimiterStyle: const TextStyle(color: kBasicColor),
    moreStyle:
    const TextStyle(color: kBasicColor, fontWeight: FontWeight.w500),
    lessStyle:
    const TextStyle(color: kBasicColor, fontWeight: FontWeight.w500),
    style: const TextStyle(fontSize: 15),
  );
}