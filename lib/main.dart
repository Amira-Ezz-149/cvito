import 'package:cvito/layout/modules/cv_layout.dart';
import 'package:cvito/layout/modules/get_started_module/get_started_screen.dart';
import 'package:cvito/layout/modules/home_screen_module/home_screen.dart';
import 'package:cvito/layout/modules/messages_module/messages_screen.dart';
import 'package:cvito/layout/modules/notifications_module/notifications_screen.dart';
import 'package:cvito/layout/modules/performance_screen.dart';
import 'package:cvito/layout/modules/related_module/related_screen.dart';
import 'package:cvito/layout/modules/sleek_slider.dart';
import 'package:cvito/layout/modules/software_company_module/software_company_screen.dart';
import 'package:cvito/layout/modules/splash_screen_module/splash_screen.dart';
import 'package:cvito/layout/modules/user_profile_module/tab_bar_user_profile_screens_modules/tab_experience_user_screen.dart';
import 'package:cvito/layout/modules/user_profile_module/user_profile_screen.dart';
import 'package:cvito/layout/modules/welcome_module/welcome_screen.dart';
import 'package:cvito/user/user_layout/user_layout.dart';
import 'package:cvito/user/user_layout/user_modules/user_create_cv_module/user_create_cv_screen.dart';
import 'package:flutter/material.dart';
import 'package:cvito/layout/modules/performance_screen.dart';
import 'package:flutter/services.dart';

import 'layout/modules/job_details_screen.dart';
import 'user/user_layout/user_modules/user_bottom_navigation_bar_module/user_home_screen_module/user_home_screen.dart';
import 'user/user_layout/user_modules/user_bottom_navigation_bar_module/user_messages_screen_module/user_messages_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  ///update
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          //primarySwatch: Colors.blue,
          // backgroundColor: kBackgroundColor,
          ),
      // routes: {
      //   WelcomeScreen.id: (context) => WelcomeScreen(),
      //   // HomeScreen.id: (context) => HomeScreen(),
      // },
      // initialRoute: SplashScreen.id,
       home: SplashScreen(),


      //  home: DrawHalfCircle(),
    );
  }
}
