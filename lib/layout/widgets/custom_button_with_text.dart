import 'package:flutter/material.dart';
//button with text
class CustomButtonWithText extends StatelessWidget {
  const CustomButtonWithText(
      {Key? key,
        required this.text,
        required this.onPressed,
        required this.bottomColor,
        required this.textColor,
        required this.height,
        required this.width,
        required this.border,
        required this.redus,
      })
      : super(key: key);
  final String? text;
  final VoidCallback? onPressed;
  final Color? bottomColor;
  final double? width;
  final double? height;
  final Color? textColor;
  final BoxBorder? border;
  final double? redus;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FittedBox(
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: border,
            color: bottomColor,
            borderRadius: BorderRadius.circular(redus!),
          ),
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 14,
              letterSpacing: 0.1,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
    );
  }
}
class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon(
      {required this.onPressed,
        required this.icon,
        required this.size,
        required this.color});
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? size;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        splashColor: Colors.transparent,
        onPressed: onPressed,
        child:Icon(
      icon,
      color: color,
      size: size,
    ),
       );
  }
}

