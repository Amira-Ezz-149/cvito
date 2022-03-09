import 'package:cvito/layout/modules/cv_layout.dart';
import 'package:cvito/layout/modules/home_screen_module/home_screen.dart';
import 'package:cvito/layout/modules/messages_module/messages_screen.dart';
import 'package:cvito/layout/modules/notifications_module/notifications_screen.dart';
import 'package:cvito/layout/modules/performance_screen.dart';
import 'package:cvito/layout/modules/related_module/related_screen.dart';
import 'package:cvito/layout/modules/sleek_slider.dart';
import 'package:cvito/layout/modules/software_company_module/software_company_screen.dart';
import 'package:cvito/layout/modules/splash_screen_module/splash_screen.dart';
import 'package:cvito/layout/modules/welcome_module/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:cvito/layout/modules/performance_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  ///update
  @override
  Widget build(BuildContext context) {
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
      // home: WelcomeScreen(),
      home:SplashScreen(),

      //  home: DrawHalfCircle(),
    );
  }
}
