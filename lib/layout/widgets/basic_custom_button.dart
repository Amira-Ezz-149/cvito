import 'package:cvito/constants/constants.dart';
import 'package:flutter/material.dart';

class BasicCustomButton extends StatelessWidget {
  BasicCustomButton({@required this.text, @required this.function});

  final String? text;
  final VoidCallback? function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text!),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        onPrimary: Colors.white,
        primary: kBasicColor,
        onSurface: Colors.grey,
        side: BorderSide(color: kBasicColor, width: 1),

        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)),
      ),
      onPressed: function,
    );
  }
}
