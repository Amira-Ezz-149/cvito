import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/constants_color.dart';
import '../services/auth_firebase_email_pass.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/text_field_search.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);
  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController resetPasswordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomButtonWithIcon(
                          onPressed: () => Get.back(),
                          color: kGrayColor130,
                          size: 25,
                          icon: Icons.arrow_back),
                      const SizedBox(width: 20),
                      text(
                          text: "Forget Password",
                          colors: kGrayColor,
                          size: 24,
                          fontWeight: FontWeight.w700),
                    ],
                  ),
                  const SizedBox(height: 44),
                  Padding(
                    padding: const EdgeInsets.only(right:148),
                    child: text(
                        text: "Reset Password",
                        colors: kBasicColor,
                        size: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 27,),
                  text(
                    text:
                        "Enter your phone number or email associated with your account and we’ll send an email with instructions to reset your password.",
                    colors: kGrayColor130,
                    spacing: 0.25,
                    size: 14,
                    align: TextAlign.center,
                    fontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 45),
                  SizedBox(
                    width: 328,
                    height: 52,
                    child: textFormField(
                       controller: resetPasswordTextEditingController,
                        radious: 4,
                        hintstyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                        hint: "email",
                        type: TextInputType.emailAddress,
                        color: kGrayColor242),
                  ),
                  const SizedBox(height: 20),
                  CustomButtonWithText(
                      redus: 6,
                      border: Border.all(color: kBasicColor,width: 2,style: BorderStyle.solid),
                      width: 328,
                      height: 50,
                      text:"Reset Password",
                      onPressed: () async {
                          await AuthenticationEmail().resetPassword(email: resetPasswordTextEditingController.text.trim()).then((result) {
                            if(result == null){
                               Navigator.of(context).pop();
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: text(
                                  text: result,
                                  colors: null,
                                  size: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ));
                            }
                          });
                      },
                      bottomColor: kBasicColor,
                      textColor: kBoxColor),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
