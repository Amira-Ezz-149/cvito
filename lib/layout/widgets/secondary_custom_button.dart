import 'package:cvito/layout/widgets/constants_color.dart';
import 'package:flutter/material.dart';


/// for company button
class SecondaryCustomButton extends StatelessWidget {
  const SecondaryCustomButton({@required this.text, @required this.function,});

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
            color: Colors.white,
            borderRadius: BorderRadius.circular(50.0),),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
            child: Text(
              text!,
              style: const TextStyle(
                color: kBasicColor,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
