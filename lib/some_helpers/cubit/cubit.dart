import 'package:cvito/company/company_layout/company_modules/company_bottom_navigation_bar_module/company_home_screen_module/company_home_screen.dart';
import 'package:cvito/company/company_layout/company_modules/company_bottom_navigation_bar_module/company_messages_screen_module/company_messages_screen.dart';
import 'package:cvito/company/company_layout/company_modules/company_bottom_navigation_bar_module/company_notifications_screen_module/company_notifications_screen.dart';
import 'package:cvito/company/company_layout/company_modules/company_bottom_navigation_bar_module/company_related_jobs_screen_module/company_related_screen.dart';
import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:cvito/some_helpers/cubit/states.dart';
import 'package:cvito/user/user_layout/user_modules/user_bottom_navigation_bar_module/user_home_screen_module/user_home_screen.dart';
import 'package:cvito/user/user_layout/user_modules/user_bottom_navigation_bar_module/user_jobs_screen_module/user_jobs_screen.dart';
import 'package:cvito/user/user_layout/user_modules/user_bottom_navigation_bar_module/user_messages_screen_module/user_messages_screen.dart';
import 'package:cvito/user/user_layout/user_modules/user_bottom_navigation_bar_module/user_notification_screen_module/user_notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/time_line_class.dart';

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

  List<Map> welcomeImages = [
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
      "image": "assets/images/grammar.png"
    },
  ];

  ///======================================================================================================================
  ///bottom navigation bar items

  int currentBottomIndex = 0;

  List screens = [
    const CompanyHomeScreen(),
    const CompanyNotificationsScreen(),
    CompanyMessagesScreen(),
    const CompanyRelatedScreen(),
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
    "assets/images/google_logo.png",
    "assets/images/facebook_logo.png",
    "assets/images/apple_logo.png",
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
    "FullStack ",
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
    const UserHomeScreen(),
    const UserNotificationsScreen(),
    UserMessagesScreen(),
    UserJobsScreen(),
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


  List<String> UserImageLinks = [
    "assets/images/person1.png",
    "assets/images/person2.png",
    "assets/images/person3.png",
    "assets/images/person4.png",
    "assets/images/person5.png",
    "assets/images/person6.png",
    "assets/images/person7.png",
    "assets/images/person8.png",
  ];


List<String> UserChatTimes = [
    "12:00 PM",
    "11:45 PM",
    "10:00 PM",
    "9:30 PM",
    "9:00 PM",
    "8:30 PM",
    "8:15 PM",
    "7:00 PM",

  ];

///============================================================================================
///==================================== notification screen =========================================
///============================================================================================


  List<String> notificationsImageLinks = [
    "assets/images/person8.png",
    "assets/images/person3.png",
    "assets/images/person4.png",
    "assets/images/person1.png",
    "assets/images/person2.png",
    "assets/images/person6.png",
    "assets/images/person7.png",
    "assets/images/person5.png",
  ];




  ///============================================================================================
  ///==================================== company related screen =========================================
  ///============================================================================================

  List<String> companyRelatedPeopleNames = [
    "Asma Abram",
    "Koshi Komar",
    "Amer Khan",
    "Akshat Sodi",
    "Brain",
    "John Micheal",
    "Ahmed Ali ",
    "Karan Danish",
  ];


  List<String> companyRelatedPeopleJobs = [
    "Web Designer",
    "Flutter Developer",
    "FullStack ",
    "Front End",
    "Game Developer",
    "UI/UX Designer",
  ];



  ///empty String list
  // var items = <String>[];
  // TextEditingController editingController = TextEditingController();
  // // final duplicateItems = List<String>.generate(10000, (i) => "Item $i");
  // // List<String> duplicateItems =['a', 'aa', 'aaa', 'aaaa', 'aaaaa'];
  // //duplicateItems = UserChatUsers
  //
  // @override
  // void initState() {
  //   items.addAll(UserChatUsers);
  // }
  //
  // void filterSearchResults(String query) {
  //   List<String> dummySearchList = <String>[];
  //   dummySearchList.addAll(UserChatUsers);
  //   if(query.isNotEmpty) {
  //     List<String> dummyListData = <String>[];
  //     for (var item in dummySearchList) {
  //       if(item.contains(query)) {
  //         dummyListData.add(item);
  //       }
  //     }
  //       items.clear();
  //       items.addAll(dummyListData);
  //     return;
  //   } else {
  //       items.clear();
  //       items.addAll(UserChatUsers);
  //
  //   }
  //   emit(CVUserUpdateChatState());
  // }

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
      icon: Icon(Icons.work_outlined),
      label: 'Jobs',
    ),
  ];

  ///==========================================================================
/// userJobsScreen
  List<String> userJobRecommendationList = [
    "Web Designer",
    "Flutter Developer",
    "FullStack Developer",
  ];


  List<String> userJobsLocationList = [
    "Cairo - Egypt",
    "Jeddah - Saudi Arabia",
    "Berlin - German",
  ];



}
