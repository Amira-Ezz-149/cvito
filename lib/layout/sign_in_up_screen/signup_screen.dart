import 'package:cvito/layout/services/signup_controller.dart';
import 'package:cvito/layout/sign_in_up_screen/signin_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../widgets/constants_color.dart';
import '../set_info_screen/set_info1_screen.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import '../widgets/text_field_search.dart';
import '../services/auth_firebase_gmail.dart';
import 'continue_with_account.dart';
import '../widgets/or_line.dart';
class SignUpScreen extends GetView<SignupController> {
  SignUpScreen({Key? key}) : super(key: key);
  Authenticationgmail authenticationGmail = Authenticationgmail();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackGroundColor,
        body: GestureDetector(
          onTap: ()=>FocusScope.of(context).unfocus(),
          child: SafeArea(
            child:
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 16),
                child: Column(
                  children: <Widget>[
                    text(text: "Create a new account",
                        colors: kBasicColor,size: 28,
                        fontWeight: FontWeight.w700,spacing: 0),
                    const SizedBox(height: 20,),
                    text(text: "Sign up to continue!",
                        align: TextAlign.center,
                        colors:kGrayColor,
                        size: 14, fontWeight: FontWeight.w400, spacing: 0.25),
                    const SizedBox(height: 15,),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: <Widget>[
                            //text Form field of name
                            SizedBox(
                              width: 328,
                              height: 70,
                              child: textFormField(
                                controller: controller.fullName ,
                                color: kGrayColor242,
                                validate: (value){
                                  if(value.isEmpty ){
                                    return "please enter your name";
                                  }else {
                                    return null;
                                  }
                                },
                                type: TextInputType.name,
                                hint: "Full name",
                                radious: 4,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            //text Form field of email
                            SizedBox(width: 328, height: 70,
                              child: textFormField(
                                controller: controller.email ,
                                color: kGrayColor242,
                                validate: (value){
                                  if(value.isEmpty || !value.contains('@')){
                                    return "please enter email address";
                                  }else {
                                    return null;
                                  }
                                },
                                type: TextInputType.emailAddress,
                                hint: "Email", radious: 4,
                              ),
                            ),
                            const SizedBox(height: 5,),
                            //text Form field of name
                            Obx(() {
                                return SizedBox(
                                  width: 328, height: 70,
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
                                      type: TextInputType.visiblePassword,
                                      hint: "Password",
                                      radious: 0,
                                      suffix: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 30.0),
                                          child: GestureDetector(
                                              onTap: () {
                                                controller.visible.value = !controller.visible.value;
                                              },
                                              child: Icon( controller.visible.value ? Icons.visibility_off : Icons.visibility)),
                                        ),
                                      ),
                                      obscureText: controller.visible.value,
                                      maxline: 1
                                  ),
                                );
                              }
                            ),
                            // create check box and forget password
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8,),
                              child: Row(
                                children: <Widget>[
                                  Theme(
                                      data: ThemeData(
                                        unselectedWidgetColor: Colors.black,
                                      ),
                                      child: Obx((){
                                          return Checkbox(
                                              value: controller.agree.value,
                                              checkColor: Colors.white,
                                              onChanged: (value) {
                                                controller.agree.value = value!;
                                              });
                                        }
                                      )),
                                  RichText(
                                    text: TextSpan(
                                        text: "I Agree With",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff4F4F4F),
                                            fontSize: 14,
                                            letterSpacing: 0.25
                                        ),
                                        children: [
                                          TextSpan(
                                              text: "Terms & Conditions",
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: kBasicColor
                                              ),
                                              recognizer: TapGestureRecognizer()..onTap = (){}
                                          ),
                                        ]
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //create text policy
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 7,vertical: 10),
                              child: RichText(
                                text: TextSpan(
                                    text: "By signing up you accept the",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff4F4F4F),
                                    ),
                                    children: [
                                      TextSpan(
                                          text: " Terms of services",
                                          style: const TextStyle(
                                              color: kBasicColor
                                          ),
                                          recognizer: TapGestureRecognizer()..onTap = (){}
                                      ),
                                      const TextSpan(
                                          text: " and "
                                      ),
                                      TextSpan(
                                          text: "Privacy Policy",
                                          style: const TextStyle(
                                              color:kBasicColor
                                          ),
                                          recognizer: TapGestureRecognizer()..onTap = () => {}
                                      )
                                    ]
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            //sign up button
                            CustomButtonWithText(
                                redus: 100,
                                border: Border.all(color: kBasicColor,width: 2,style: BorderStyle.solid),
                                width: 215,
                                height: 43,
                                text:"Sign Up",
                                onPressed:() async{
                                  _formKey.currentState!.validate();
                                  if(!controller.isValid()){
                                    return;
                                  }
                                  final isUserSignup = await controller.isUserSigneUp();
                                  if(!isUserSignup ){
                                    controller.onCreateAccount();
                                  }else{
                                    Get.snackbar('hint', "this account is already signup");
                                  }

                                },
                                bottomColor: kBasicColor,
                                textColor: kGrayColor242),
                            const SizedBox(height: 10,),
                            // the line
                            orLine(padding: 0),
                            const SizedBox(height: 10,),
                            text(
                                text:"Continue With",
                                colors: kGrayColor,
                                size: 14,
                                fontWeight: FontWeight.w400,
                                spacing: 0.25),
                            //gmail account
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
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
                            const SizedBox(height: 30,),
                            // don't have an account
                            RichText(
                              text: TextSpan(
                                  text: "Already have an account?",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff4F4F4F),
                                      fontSize: 14,
                                      letterSpacing: 0.25
                                  ),
                                  children: [
                                    TextSpan(
                                        text: " Login",
                                        style: const TextStyle(
                                            color: kBasicColor
                                        ),
                                        recognizer: TapGestureRecognizer()..onTap = (){
                                          Get.to(()=>SignInScreen());
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

