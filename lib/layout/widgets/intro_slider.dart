import 'package:flutter/material.dart';

class IntroSlider extends StatelessWidget {
  String? imageLink;
  String? title;
  String? description;
  IntroSlider({
    this.imageLink,
    this.title,
    this.description,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: MediaQuery
                .of(context)
                .size
                .height / 2.5,
            decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(imageLink!),
                )),
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(title!,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(description!,
            textAlign: TextAlign.center),
      ],
    );
  }
}

