import 'package:cvito/helpers/custom_error_screen.dart';
import 'package:cvito/layout/modules/performance_screen.dart';
import 'package:cvito/layout/modules/splash_screen_module/splash_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() async{
  // await Firebase.initializeApp();
 customErrorScreen();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);



  ///update term2
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    debugInvertOversizedImages = true;
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
       home: const SplashScreen(),


      //  home: DrawHalfCircle(),
    );
  }
}
