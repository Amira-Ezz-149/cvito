import 'package:bloc/bloc.dart';
import 'package:cvito/constants/constants.dart';
import 'package:cvito/cubit/states.dart';
import 'package:cvito/layout/modules/user_profile_module/tab_bar_user_profile_screens_modules/tab_experience_user_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/time_line_class.dart';
import '../layout/modules/home_screen_module/home_screen.dart';
import '../layout/modules/messages_module/messages_screen.dart';
import '../layout/modules/notifications_module/notifications_screen.dart';
import '../layout/modules/related_module/related_screen.dart';
import '../user/user_layout/user_modules/user_bottom_navigation_bar_module/user_home_screen_module/user_home_screen.dart';
import '../user/user_layout/user_modules/user_bottom_navigation_bar_module/user_messages_screen_module/user_messages_screen.dart';
import '../user/user_layout/user_modules/user_bottom_navigation_bar_module/user_notification_screen_module/user_notification_screen.dart';
import '../user/user_layout/user_modules/user_bottom_navigation_bar_module/user_related_screen_module/user_related_screen.dart';

class CVCubit extends Cubit<CVStates> {
  CVCubit() : super(InitialState());

  int currentPage = 0;

  static CVCubit get(context) => BlocProvider.of(context);

  void changeCurrentPage(int value) {
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
    ///=========================================================================
    /// Create An Automated CV   ... rafiki image
    {
      "title": "Create An Automated CV",
      "description": "Our app helps you to build an automated CV differently!",
      "image": "assets/images/rafiki.png"
    },

    ///=========================================================================
    /// find your job ....bro image

    {
      "title": 'Find Your Job',
      "description":
          "It will also help you to find a job remotely without recruiters.",
      "image": "assets/images/bro.png"
    },

    ///=========================================================================
    ///find Employess  ....business image

    {
      "title": "Find Employees",
      "description": "A company can also find its employees!",
      "image": "assets/images/business.png"
    },

    ///=========================================================================
    ///Create a manual CV  ....rafikti image

    {
      "title": "Create A Manual CV",
      "description":
          "Create your CV with yourself and customize it with any template that attracts you.",
      "image": "assets/images/rafikti.png"
    },

    ///=========================================================================
    ///Create a manual CV  ....rafikti image

    {
      "title": "Rephrase Awesome CV",
      "description":
          "Correct the grammar of your CV and rephrase it technically.",
      "image": "assets/images/grammer_chaeck.png"
    },
  ];

  ///======================================================================================================================
  ///bottom navigation bar items

  int currentBottomIndex = 0;

  List screens = [
    HomeScreen(),
    NotificationsScreen(),
    MessagesScreen(),
    RelatedScreen(),
  ];

  void changeBottomNavBarIndex(int index) {
    currentBottomIndex = index;
    emit(CVBottomNavState());
  }

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications_active_sharp),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      label: 'Related',
    ),
  ];

  ///================================================================================
  ///companies names list
  List<String> companiesLogos = [
    "assets/images/linkedIn_logo.png",
    "assets/images/rafiki.png",
    "assets/images/rafiki.png",
    "assets/images/rafiki.png",
    "assets/images/bro.png",
    "assets/images/bro.png",
    "assets/images/bro.png",
    "assets/images/bro.png",
  ];

  ///========================================================================
  ///MessagesScreen
  ///====================================
  ///companies names list
  List<String> chatUsers = [
    "Amit",
    "Brem",
    "Amer ",
    "Akshat",
    "Brain",
    "John",
    "Danish",
    "Sam",
  ];

  ///======================================
  ///delete chat item
  void deleteChatItem(BuildContext context, int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${chatUsers[index]} chat is deleted"),
          ],
        ),
        duration: const Duration(seconds: 1),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        // behavior: SnackBarBehavior.floating,
      ),
    );
  }

  ///===========================================================================
  /// TabHomeScreen
  _launchEmail() async {
    launch("mailto:miraezz14@gmail.com");
  }

  setLaunch() {
    _launchEmail();
    emit(CVEmailLaunch());
  }

  double rating = 0;

  void ratingUpdate(double rating) {
    this.rating = rating;
    emit(CVRatingUpdate());
  }

  ///=============================================================================
  /// job applicant names
  List<String> jobsNames = [
    "Web Designer",
    "Flutter Developer",
    "Backend Developer ",
    "Android Developer",
    "FullStack Developer",
  ];

  List<String> jobLocations = [
    "Cairo-Cairo-Egypt",
    "Giza Cairo-Egypt",
    "Nasr City Cairo-Egypt",
    "Maady Cairo-Egypt",
    "Mansoura Cairo-Egypt",
  ];

  ///=================================================================================
  /// user screen (experience section)
  List<TimelineModel> userExperienceList = const [
    TimelineModel(
      id: "1",
      title: "2020-2022",
      description: "software development company",
      location: 'giza - egypt',
      hh: 'android developer ',
      lineColor: Colors.black,
      // descriptionColor: Colors.green,
      titleColor: Colors.green,
    ),
    TimelineModel(
      id: "2",
      title: "2018-2020",
      description: "eltawfeq  company",
      location: 'giza - egypt',
      hh: 'android developer ',
      lineColor: Colors.black,
      // descriptionColor: Colors.red,
      titleColor: Colors.indigo,
    ),
    TimelineModel(
      id: "3",
      title: "2015-2018",
      description: "software development company",
      location: 'giza - egypt',
      hh: 'android developer ',
      lineColor: Colors.black,
      // descriptionColor: Colors.green,
      titleColor: Colors.green,
    )
  ];


  List<TimelineModel> userEducationList = const [
    TimelineModel(
      id: "3",
      title: "2020-2022f",
      description: "software development companyf",
      location: 'giza - egyptf',
      hh: 'android developerf ',
      lineColor: Colors.black,
      // descriptionColor: Colors.green,
      titleColor: Colors.green,
    ),
    TimelineModel(
      id: "4",
      title: "2018-2020f",
      description: "eltawfeq  companyf",
      location: 'giza - egyptf',
      hh: 'android developerf ',
      lineColor: Colors.black,
      // descriptionColor: Colors.red,
      titleColor: Colors.indigo,
    ),

  ];

  ///===================================================================================================================
  ///===================================================================================================================
  ///===================================================================================================================
/// User Layout

  List userscreens = [
    UserHomeScreen(),
    UserNotificationsScreen(),
    UserMessagesScreen(),
    UserRelatedScreen(),
  ];

  List<String> UserChatUsers = [
    "Amit",
    "Brem",
    "Amer ",
    "Akshat",
    "Brain",
    "John",
    "Danish",
    "Sam",
  ];

  int userCurrentBottomIndex = 0;

  void userChangeBottomNavBarIndex(int index) {
    userCurrentBottomIndex = index;
    emit(CVBottomNavState());
  }

  List<BottomNavigationBarItem> UserBottomItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.notifications_active_sharp),
      label: 'Notifications',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      label: 'Messages',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.group),
      label: 'Related',
    ),
  ];

}
