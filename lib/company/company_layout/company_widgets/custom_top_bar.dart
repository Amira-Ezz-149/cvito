import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget {
  String title, imageLink;
  VoidCallback? function;
  Color color;

  CustomTopBar(
      {Key? key,
      required this.title,
      required this.imageLink,
        this.function,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: function,
            child: CircleAvatar(
              radius: 20,
              child: Image.asset(imageLink),
            ),
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
              icon: const Icon(
                Icons.settings,
                color: Colors.transparent,
              ))
        ],
      ),
    );
  }
}
