import 'package:cvito/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Container(
              color: Colors.amber,
              width: 120,
              height: 120,
              child: const Text(
                'this is home screen',
                style: TextStyle(color: kBasicColor),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
          CustomButton(
              text: 'next',
              function: () {
                debugPrint('ok is pressed');
              })
        ],
      ),
    );
  }
}
