import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
///any color or text style and Box Decoration we will define here, his name should start with letter k

const Color kBasicColor = Color.fromRGBO(0, 119, 181, 1);
const Color kBoxColor = Color.fromRGBO(255, 255, 255, 0.9);
const Color kBackGroundColor = Color(0xffEAEFF5);
const Color kGrayColor = Color.fromRGBO(79, 79, 79, 1);
const Color kGrayColor130 = Color.fromRGBO(130, 130, 130, 1);
const Color kGrayColor242 =Color.fromRGBO(242, 242, 242, 1);
const Color kGrayColor189 =Color.fromRGBO(189, 189, 189, 1);

///Example on test style
///    TextStyle kTextTitleDecoration1 = TextStyle(fontSize: 40.0);
TextStyle kWelcomeText = const TextStyle(
    color: Color(0xff040404), fontSize: 50, fontWeight: FontWeight.w700);

void showAlert(String message){
  Fluttertoast.showToast(msg: message);
}


