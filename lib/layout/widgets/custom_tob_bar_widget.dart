import 'package:flutter/material.dart';
class CustomTopBar extends StatelessWidget {
  String title, imageLink;
  Color color;

  CustomTopBar(
      {Key? key,
        required this.title,
        required this.imageLink,
        required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
          child: Image.asset(imageLink),
        ),
        const SizedBox(width: 20.0),
        SizedBox(width: MediaQuery.of(context).size.width / 20),
        Text(
          title,
          style: TextStyle(
              color: color, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        const Spacer(),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: color,
            ))
      ],
    );
  }
}