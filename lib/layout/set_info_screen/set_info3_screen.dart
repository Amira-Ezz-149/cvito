import 'package:cvito/layout/set_info_screen/set_info4_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/constants_color.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
class SetInfo3 extends StatefulWidget {
  const SetInfo3({Key? key}) : super(key: key);

  @override
  State<SetInfo3> createState() => _SetInfo3State();
}

class _SetInfo3State extends State<SetInfo3> {

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
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 33,horizontal: 36),
                  child: text(
                      text: "Step  3/3",
                      spacing: 0.25,
                      colors: kGrayColor189,
                      size: 24,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 20,),
            text(
                text: "Enable your location",
                colors: kBasicColor,
                size: 24,
                fontWeight: FontWeight.w700),
            SizedBox(child: Image.asset("assets/images/location.png")),
            Padding(
              padding: const EdgeInsets.only(top: 70,right: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  color: kBasicColor,
                  width: 46,
                  height: 6,
                ),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,left: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(onPressed: (){
                    Get.back();
                    },
                    text: "Previous",
                    size: 18,
                    color: kGrayColor130,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomButtonWithText(
                      redus: 100,
                      border: Border.all(color: kBasicColor,width: 2,style: BorderStyle.solid),
                      textColor: Colors.white,
                      width: 100,
                      height: 40,
                      text: "Enable",
                      onPressed: (){
                        Get.to(const SetInfo4());
                      },
                      bottomColor: kBasicColor),
                ],
              ),
            ),
          ],
        ),
    ),
        ),
      ),
    );
  }
}
