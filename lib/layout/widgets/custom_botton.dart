import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.text, required this.onPressed,required this.color,required this.size,required this.fontWeight})
      : super(key: key);
  final String? text;
  final Color? color;
  final VoidCallback? onPressed;
  final double size;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text!,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontFamily: "Roboto",
            fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
