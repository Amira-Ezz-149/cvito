import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/constants_color.dart';
import '../widgets/basic_constant_text.dart';

class Indicator{
  static void showLoading(String loading){
    Get.dialog(Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/app_logo.png'),
            const CircularProgressIndicator(),
            text(
              text: loading,
              align:TextAlign.center,
              fontWeight: FontWeight.w400,
              size: 14,
              spacing: 0.25,
              colors:kGrayColor,
            ),
          ],
        ),
      ),
    ));
  }
  static void closeLoading(){
    if(Get.isDialogOpen!){
      Get.back();
    }
  }
}