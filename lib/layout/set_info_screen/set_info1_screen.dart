import 'package:cvito/layout/set_info_screen/set_info2_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/constants_color.dart';
import '../services/pick_image.dart';
import '../widgets/custom_button_with_text.dart';
import 'package:get/get.dart';

import '../widgets/basic_constant_text.dart';
class SetInfo1 extends GetView {
  const SetInfo1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomButtonWithIcon(onPressed: (){},color: kGrayColor130,size: 25,icon: Icons.arrow_back),
                    const SizedBox(width: 20,),
                    text(
                        text: "Set up your info",
                        colors: kGrayColor,
                        size: 24,
                        fontWeight: FontWeight.w700),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 33,horizontal: 36),
                      child: text(
                          text: "Step  1/3",
                          spacing: 0.25,
                          colors: kGrayColor189,
                          size: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                text(
                  text: "Set your Profile picture",
                  colors: kBasicColor,
                  size: 24,
                  fontWeight: FontWeight.w700,
                ),
                const SizedBox(height: 45,),
                const PickImage(),
                const SizedBox(height: 80,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    color: kBasicColor,
                    width: 35,
                    height: 6,
                  ),),
                const SizedBox(height: 30,),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:250 ),
                      child: CustomButtonWithText(
                          redus: 100,
                          textColor:kBoxColor,
                          width: 100,
                          border: Border.all(color: kBasicColor,width: 2,style: BorderStyle.solid),
                          height: 40,
                          text: "Next",
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            Get.to(const SetInfo2(),);
                          },
                          bottomColor: kBasicColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}


