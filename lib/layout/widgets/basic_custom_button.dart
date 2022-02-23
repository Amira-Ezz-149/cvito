import 'package:cvito/constants.dart';
import 'package:flutter/material.dart';

class BasicCustomButton extends StatelessWidget {
  BasicCustomButton({@required this.text, @required this.function});

  final String? text;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: function,
      child: FittedBox(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: kBasicColor),
              color: kBasicColor,
              // boxShadow: const [
              //   BoxShadow(
              //     color: Colors.grey,
              //     offset: Offset(0, 3), //(x,y)
              //     blurRadius: 5,
              //   ),
              // ],
              borderRadius: BorderRadius.circular(50.0),),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: Text(
              text!,
              style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
