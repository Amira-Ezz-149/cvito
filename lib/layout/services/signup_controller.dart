import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_firebase_email_pass.dart';
import 'firebase_function.dart';
import 'indecator.dart';

class SignupController extends GetxController{
  final AuthenticationEmail _authenticationEmail = AuthenticationEmail();
  final FirebaseFunctions _firebaseFunctions = FirebaseFunctions();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final visible = RxBool(true);
  final agree = RxBool(false);

  bool isValid(){
    if(fullName.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty){
      return true;
    }else{
      return false;
    }
  }
  Future<bool> isUserSigneUp()async{
    final userQuery = FirebaseFirestore.instance.collection('users').where('email',isEqualTo: email.text);
    final result = await userQuery.get();
    if(result.docs.isEmpty){
      return false;
    }else{
      return true;
    }
  }
  void onCreateAccount() async{
      Indicator.showLoading("SignUp....");
      await _authenticationEmail.signUp(email: email.text, password: password.text, name: fullName.text).then((value){
        _firebaseFunctions.creatUserCredential(fullName.text, email.text);
      });
  }
}