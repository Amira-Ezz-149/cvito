import 'package:flutter/material.dart';
import 'layout/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: WelcomeScreen(),

      //  home: DrawHalfCircle(),
    );
  }
}
