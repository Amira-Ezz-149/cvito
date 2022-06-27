import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  var controller = TextEditingController();
  String labelName;
  String hint;
  IconData icon;
  Color iconColor;
  TextInputType textType;

  MyTextField(
      {required this.controller,
      required this.labelName,
      required this.hint,
      required this.icon,
      required this.iconColor,
      required this.textType,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              labelText: labelName,
              hintText: hint,
              hintStyle: const TextStyle(fontSize: 20),
              labelStyle: const TextStyle(fontSize: 25),
              icon: Icon(
                icon,
                color: iconColor,
              )

          ),
          keyboardType: textType,
        ) // Input Decoration,TextField
        ); // Container
  }
}
