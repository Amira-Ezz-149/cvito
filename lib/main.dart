import 'package:cvito/layout/widgets/constants_color.dart';
import 'package:cvito/layout/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'layout/manuall_cv/manuall_cv_screen.dart';
import 'layout/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'layout/services/instance_binding.dart';
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InstanceBinding(),
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kBasicColor,
        primarySwatch: Colors.blue,
        backgroundColor: Colors.blue,
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xffF4EFF4),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kBoxColor),
          ),
        ),
      ),
      routes: {
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        // HomeScreen.id: (context) => HomeScreen(),
      },
      initialRoute: SplashScreen.id,
      home: ManuallyCv(),
    );
  }
}
