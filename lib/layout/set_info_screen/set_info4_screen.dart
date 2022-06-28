import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/constants_color.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';

class SetInfo4 extends StatelessWidget {
  const SetInfo4({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kBackGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    CustomButtonWithIcon(
                        onPressed: (){
                          Get.back();
                        },
                        color: kGrayColor130,
                        size: 25,
                        icon: Icons.arrow_back),
                    const SizedBox(width: 20,),
                    text(
                        text: "Set up your info",
                        colors: kGrayColor,
                        size: 24,
                        fontWeight: FontWeight.w700),
                  ],
                ),
                const SizedBox(height: 60,),
                text(
                    text: "All Set!",
                    colors: kBasicColor,
                    size: 24,
                    fontWeight: FontWeight.w700),
                const SizedBox(height: 30,),
                SizedBox(
                    child: Image.asset("assets/images/done.jpg",width: 330,height: 330,)),
                const SizedBox(height: 25,),
                const SizedBox(
                  width: 307,
                  child: Text(
                    "Thanks for help, now you cn continue to your profile.",
                    textAlign:TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      letterSpacing: 0.25,
                      color: kGrayColor),
                    ),
                ),
                const SizedBox(height: 30,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Container(
                    color: kBasicColor,
                    width: 54,
                    height: 6,
                  ),),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButtonWithText(
                      redus: 100,
                      border: Border.all(color: kBasicColor,width: 2,style: BorderStyle.solid),
                      textColor: Colors.white,
                      width: 100,
                      height: 40,
                      text: "Continue",
                      onPressed: () {},
                      bottomColor: kBasicColor),
                ),
              ],
            ),
          ),
        ),
      ),
      );

  }
}
