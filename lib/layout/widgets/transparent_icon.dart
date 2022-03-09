import 'package:flutter/material.dart';

class TransparentIcon extends StatelessWidget {
  TransparentIcon({required this.icon, this.onPressed});

  IconData icon;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white.withOpacity(.10),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: Colors.white,
            size: 20.0,
          )),
    );
  }
}
