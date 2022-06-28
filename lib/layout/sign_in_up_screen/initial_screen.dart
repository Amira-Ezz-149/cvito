import 'package:cvito/layout/sign_in_up_screen/continue_with_account.dart';
import 'package:get/get.dart';
import '../widgets/constants_color.dart';
import '../services/auth_firebase_gmail.dart';
import '../widgets/custom_button_with_text.dart';
import '../widgets/basic_constant_text.dart';
import 'signin_screen.dart';
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '../screens/splash_screen.dart';
import '../widgets/or_line.dart';
class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);
  static const String id = 'WelcomeScreen';
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
   Authenticationgmail authenticationGmail = Authenticationgmail();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:Container(
            padding: const EdgeInsets.symmetric(vertical: 80,horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                //logo of cvito
                Image.asset('assets/images/app_logo.png'),
                const SizedBox(height: 35,),
                text(
                     text: "Now, get started with login or sign up to get in touch ",
                    align:TextAlign.center,
                    fontWeight: FontWeight.w400,
                    size: 14,
                    spacing: 0.25,
                    colors:kGrayColor,
                ),
                const SizedBox(height: 35,),
                //button of login
                CustomButtonWithText(
                    redus: 100,
                    border: Border.all(color: kBasicColor,width: 2,style: BorderStyle.solid),
                    width: 242,
                    height: 40,
                    text:"Login", onPressed: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  Get.to(SignInScreen(),
                          transition: Transition.cupertinoDialog,
                          duration: const Duration(milliseconds: 500));
                    }, bottomColor:kBasicColor,
                    textColor: kBoxColor),
                const SizedBox(height: 25,),
                // button of signup
                CustomButtonWithText(
                    redus: 100,
                    border: Border.all(color: kBasicColor,width: 2,style: BorderStyle.solid),
                    width: 242,
                    height: 40,
                    text:"Sign up", onPressed: (){
                  FocusScope.of(context).requestFocus(FocusNode());
                  Get.to(SignUpScreen(),
                      transition: Transition.cupertinoDialog,
                      duration: const Duration(milliseconds: 500));
                }, bottomColor: kBoxColor ,
                    textColor: kBasicColor),
                const SizedBox(height: 35,),
                orLine(padding: 0),
                const SizedBox(height: 30,),
                text(
                    size: 14,
                    text: "Continue With",
                    fontWeight: FontWeight.w400,
                    colors: kGrayColor),
                const SizedBox(height: 15,),
                //sig in with google
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ContinueWith(image: "assets/images/linkedin.png", onPressed: (){}),
                      ContinueWith(image: "assets/images/github.png", onPressed: (){}),
                      ContinueWith(image: "assets/images/gmail.png", onPressed: () async {
                        await authenticationGmail.signInWithGoogle().then((result) {
                          if (result == null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SplashScreen()));
                          }
                        });
                      },),
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
