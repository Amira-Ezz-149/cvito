
import 'package:cvito/layout/widgets/basic_custom_button.dart';
import 'package:cvito/layout/widgets/secondary_custom_button.dart';
import 'package:flutter/material.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: BasicCustomButton(text: 'Personal', function: () {}),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SecondaryCustomButton(text: 'Company', function: () {}),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// buttonBorderAndTextColor: kBasicColor,buttonColor: Colors.white,
