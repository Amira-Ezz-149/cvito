import 'package:flutter/material.dart';
class ContinueWith extends StatelessWidget {
   const ContinueWith({Key? key, required this.image ,required this.onPressed}) : super(key: key);
   final String? image;
   final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: TextButton(
        onPressed: onPressed,
        child: Image.asset(image!),
        style: ButtonStyle(shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
        )),
      ),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    );
  }
}
