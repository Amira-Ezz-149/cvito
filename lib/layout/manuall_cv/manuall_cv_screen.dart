import 'package:flutter/material.dart';

import '../widgets/basic_constant_text.dart';
import '../widgets/constants_color.dart';

class ManuallyCv extends StatefulWidget {
  const ManuallyCv({Key? key}) : super(key: key);

  @override
  _ManuallyCvState createState() => _ManuallyCvState();
}

class _ManuallyCvState extends State<ManuallyCv> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                    child: text(
                        text: "Personal Details",
                        size: 20,
                        fontWeight: FontWeight.w900,
                        colors: kGrayColor)),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
