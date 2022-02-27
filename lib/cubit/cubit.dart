import 'package:bloc/bloc.dart';
import 'package:cvito/constants/constants.dart';
import 'package:cvito/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CVCubit extends Cubit<CVStates>{
  CVCubit() : super(InitialState());

  int currentPage = 0;

  static CVCubit get(context)=> BlocProvider.of(context);
  void changeCurrentPage(int value){
    currentPage = value;
    emit(CurrentPageInWelcomeScreenState());
  }
  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
          color: currentPage == index ? kBasicColor : Colors.grey,
          borderRadius: BorderRadius.circular(3)),
      duration: kAnimationDuration,
    );
  }

  List<Map> welcomeData = [
    ///============================================
    /// Create An Automated CV   ... rafiki image
    {
      "title": "Create An Automated CV",
      "description": "Our app helps you to build an automated CV differently!",
      "image": "assets/images/rafiki.png"
    },

    ///=====================================================================================
    /// find your job ....bro image

    {
      "title": 'Find Your Job',
      "description":
      "It will also help you to find a job remotely without recruiters.",
      "image": "assets/images/bro.png"
    },

    ///======================================================================================
    ///find Employess  ....business image

    {
      "title": "Find Employees",
      "description": "A company can also find its employees!",
      "image": "assets/images/business.png"
    },

    ///============================================================================================
    ///Create a manual CV  ....rafikti image

    {
      "title": "Create A Manual CV",
      "description":
      "Create your CV with yourself and customize it with any template that attracts you.",
      "image": "assets/images/rafikti.png"
    },
  ];

}