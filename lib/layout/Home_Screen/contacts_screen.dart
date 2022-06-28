import 'package:cvito/layout/widgets/animated_website_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/constants_color.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/animated_social_link_weidget.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
              child: Row(
                children: [
                  IconButton(
                      color: kGrayColor,
                      onPressed: () {Get.back();},
                      icon: const Icon(Icons.arrow_back)),
                  SizedBox(width: MediaQuery.of(context).size.width / 20),
                  Expanded(
                      child: text(
                          text: "Edit Contacts",
                          size: 24,
                          fontWeight: FontWeight.w700,
                          colors: kGrayColor)),
                ],
              ),
            ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: AnimatedSocialLink()),
          const Padding(
              padding: EdgeInsets.only(left: 16,right: 16,top: 16),
              child: AnimatedWebsite()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38,horizontal: 16),
            child: CustomButtonWithText(
              redus: 6,
              height: 44,
              width: 328,
              bottomColor: kBasicColor,
              textColor: kBoxColor,
              text: "Save",
              onPressed: () {},
              border: Border.all(color: kBasicColor),
            ),
          ),
        ],
      ),
    )));
  }
}
