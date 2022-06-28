import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../set_info_screen/set_info1_screen.dart';
import 'auth_firebase_email_pass.dart';
import 'indecator.dart';
class SignInController extends GetxController{
  final AuthenticationEmail _authenticationEmail = AuthenticationEmail();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  final visible = RxBool(true);
  final remember = RxBool(false);
  void onSignIn() async{
    if(email.text.isNotEmpty && password.text.isNotEmpty){
      Indicator.showLoading("Login...");
      await _authenticationEmail.signIn(email: email.text, password: password.text).then((value)async{
        await Future.delayed(const Duration(seconds: 1));
        Indicator.closeLoading();
        if(value != null){
          return;
        }else{
        Get.to(()=>const SetInfo1());
        }
      });
    }else{

    }
  }
}