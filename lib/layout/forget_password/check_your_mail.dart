import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/constants_color.dart';
import '../widgets/custom_botton.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import 'create_new_password.dart';
class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.only(top: 40,left: 15,right: 15),
                child: Row(
                  children: [
                    CustomButtonWithIcon(onPressed: (){},color: const Color.fromRGBO(130, 130, 130, 1),size: 25,icon: Icons.arrow_back),
                    Padding(
                      padding: const EdgeInsets.only(left: 45),
                      child: text(
                          text:"Forget Password",
                          colors: const Color.fromRGBO(79, 79, 79, 1),
                          size: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20,right: 151,top: 44,bottom: 22),
                child: text(
                    text: "Reset Password",
                    colors: const Color.fromRGBO(0, 119, 181, 1),
                    size: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                  height: 300,
                  width: 300,
                  child: SizedBox(child: Image.asset("assets/images/pana.png"))
              ),
              Padding(
                padding: const EdgeInsets.only(left:26,right: 33,bottom:25,top: 20),
                child: text(
                    text: "we have sent a password recover instructions to your email.",
                    colors: const Color.fromRGBO(130, 130, 130, 1),
                    spacing: 0.25,
                    size: 14,
                    align: TextAlign.center,
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 4,left: 15,right: 17),
                  child: GestureDetector(
                    onTap: (){
                      FocusScope.of(context).unfocus();
                    },
                    child: FittedBox(
                      child: Container(
                        width: 328,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: kBasicColor),
                          color: const Color.fromRGBO(0, 119, 181, 1),
                          borderRadius: BorderRadius.circular(6),),
                        child: text(
                            text: "Open Email App",
                            colors: const Color.fromRGBO(255, 255, 255, 1),
                            spacing: 0.1,
                            size: 14,
                            align: TextAlign.center,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 12),
                  child: CustomButton(
                    onPressed: () {
                      Get.to(CreateNewPassword());
                    },
                    text: "Skip, i’ll confirm later",
                    size: 14,
                    color: const Color.fromRGBO(130, 130, 130, 1),
                    fontWeight: FontWeight.w500,),)
            ],
          ),
        ),
      ),
    );
  }
}