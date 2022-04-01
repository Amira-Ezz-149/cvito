import 'package:cvito/constants/constants.dart';
import 'package:cvito/layout/modules/cv_layout.dart';
import 'package:cvito/layout/widgets/basic_custom_button.dart';
import 'package:cvito/layout/widgets/secondary_custom_button.dart';
import 'package:cvito/user/user_layout/user_layout.dart';
import 'package:cvito/utilities.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: kBasicColor,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/get_started.png'),
              const SizedBox(height: 15.0),
              const Text(
                'Get Started!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              const SizedBox(height: 5),
              const Text('Start As'),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BasicCustomButton(text: 'Personal', function: () {

                  navigateTo(context: context, widget: const UserLayoutScreen());
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SecondaryCustomButton(text: 'Company', function: () {
                  navigateTo(context: context, widget: const LayoutScreen());

                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

