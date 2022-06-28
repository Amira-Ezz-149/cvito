import 'package:cvito/layout/services/signin_controller.dart';
import 'package:cvito/layout/widgets/or_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/constants_color.dart';
import '../forget_password/reset_password_screen.dart';
import '../set_info_screen/set_info1_screen.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/text_field_search.dart';
import '../services/auth_firebase_gmail.dart';
import '../widgets/custom_botton.dart';
import 'continue_with_account.dart';
import 'signup_screen.dart';

class SignInScreen extends GetView<SignInController> {
  SignInScreen({Key? key}) : super(key: key);
  Authenticationgmail authenticationGmail = Authenticationgmail();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackGroundColor,
        body: GestureDetector(
          onTap: ()=> FocusScope.of(context).unfocus(),
          child: SafeArea(
            child:SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 37),
                child: Column(
                  children: <Widget>[
                    text(text: "Wellcome Back!",colors: kBasicColor,size: 32,fontWeight: FontWeight.w700,spacing: -0.25),
                    const SizedBox(height: 20,),
                    text(text: "Login to your account!",colors: kGrayColor,size: 14,fontWeight: FontWeight.w400,spacing: 0.25),
                    const SizedBox(height: 30,),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            //text field of email
                            SizedBox(
                              width: 328,
                              height: 70,
                              child: textFormField(
                                controller: controller.email,
                                color: kGrayColor242,
                                validate: (value){
                                  if(value.isEmpty || !value.contains('@')){
                                    return "please enter a valid email address";
                                  }else {
                                    return null;
                                  }
                                },
                                type: TextInputType.emailAddress,
                                hint: "username or email",
                                radious: 4,
                              ),
                            ),
                            const SizedBox(height: 7,),
                            Obx((){
                                return SizedBox(
                                  width: 328,
                                  height: 70,
                                  child: textFormField(
                                      controller: controller.password,
                                      color: kGrayColor242,
                                      validate: (value){
                                        if(value.isEmpty || value.length < 6){
                                          return "password must be at least 6 characters";
                                        }else {
                                          return null;
                                        }
                                      },
                                      hint: "Password",
                                      type: TextInputType.visiblePassword,
                                      radious: 4,
                                      suffix:SizedBox(
                                        child: GestureDetector(
                                            onTap: () {
                                              controller.visible.value = !controller.visible.value;
                                            },
                                            child: Icon(controller.visible.value ? Icons.visibility_off : Icons.visibility)),
                                      ),
                                      obscureText: controller.visible.value,
                                      maxline: 1
                                  ),
                                );
                              }
                            ),
                            // create check box and forget password
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12),
                                  child: SizedBox(
                                    height: 60,
                                    child: Row(
                                      children: <Widget>[
                                        Obx((){
                                            return Theme(
                                                data: ThemeData(
                                                  unselectedWidgetColor: Colors.black,
                                                ),
                                                child: Checkbox(
                                                    value: controller.remember.value,
                                                    checkColor: Colors.white,
                                                    onChanged: (value) {
                                                      controller.remember.value = value!;
                                                    }));
                                          }
                                        ),
                                        text(
                                            text: "Remember me",
                                            colors: kGrayColor,
                                            size: 14,
                                            fontWeight: FontWeight.w400,
                                            spacing: 0.25
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                CustomButton(text: "Forget Password ?", onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const ResetPassword())),color: kBasicColor,size: 14,fontWeight: FontWeight.bold,)
                              ],),
                            const SizedBox(height: 25,),
                            //login button
                            CustomButtonWithText(
                                redus: 100,
                                border: Border.all(color: kBasicColor,width: 2,style: BorderStyle.solid),
                                width: 215,
                                height: 43,
                                text:"Login",
                                onPressed: (){
                                  if(_formKey.currentState!.validate()){
                                    controller.onSignIn();
                                  }
                                },
                                bottomColor: kBasicColor,
                                textColor: kBoxColor),
                            const SizedBox(height: 25,),
                            // the line
                            orLine(padding: 0),
                            const SizedBox(height: 25,),
                            //text continue with
                            text(
                                text:"Continue With",
                                colors: kGrayColor,
                                size: 14,
                                fontWeight: FontWeight.w400,
                                spacing: 0.25),
                            //gmail and linkedin
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal:40,vertical: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  ContinueWith(image: "assets/images/linkedin.png", onPressed: (){}),
                                  ContinueWith(image: "assets/images/github.png", onPressed: (){}),
                                  ContinueWith(image: "assets/images/gmail.png", onPressed: () async {
                                    await authenticationGmail.signInWithGoogle().then((result) {
                                      if (result == null) {
                                        Get.to(()=>SetInfo1());
                                      }
                                    });
                                  },),
                                ],
                              ),
                            ),
                            // don't have an account
                            const SizedBox(height: 60,),
                            RichText(
                              text: TextSpan(
                                  text: "Don't have an account?",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff4F4F4F),
                                      fontSize: 14,
                                      letterSpacing: 0.25
                                  ),
                                  children: [
                                    TextSpan(
                                        text: " Sign Up",
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: kBasicColor
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap = (){
                                          Get.to(()=>SignUpScreen());
                                        }
                                    ),
                                  ]
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }

}



