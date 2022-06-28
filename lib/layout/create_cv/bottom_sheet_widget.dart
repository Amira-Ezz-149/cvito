import 'package:flutter/material.dart';

import '../widgets/constants_color.dart';
import '../widgets/custom_button_with_text.dart';
import 'bottomsheet_site.dart';
void BottomSheets(BuildContext context) {
  showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.35,
          decoration: const BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                  topLeft: Radius.circular(24))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 128,vertical: 26),
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(30.0),
                  child: Container(
                    color: kGrayColor130,
                    width: 103,
                    height: 3.72,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 26,horizontal: 16),
                child: CustomButtonWithText(
                  redus: 6,
                  height: 55,
                  width: 328,
                  bottomColor: kBasicColor,
                  textColor: kBoxColor,
                  text: "Create An Automated CV",
                  onPressed: () {
                    BottumSheetSite(context);
                  },
                  border: Border.all(color: kBasicColor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 43),
                child: CustomButtonWithText(
                  redus: 6,
                  height: 55,
                  width: 328,
                  bottomColor: const Color.fromRGBO(147, 143, 153, 1),
                  textColor: kBoxColor,
                  text: "Create A Manual CV",
                  onPressed: () {},
                  border: Border.all(color: const Color.fromRGBO(147, 143, 153, 1)),
                ),
              ),
            ],
          ),
        );
      }
  );
}