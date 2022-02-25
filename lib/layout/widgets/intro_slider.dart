import 'package:cvito/layout/widgets/clip_path.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:flutter/material.dart';

class IntroSliderContent extends StatelessWidget {
  const IntroSliderContent({
    Key? key,
    required this.description,
    required this.imageLink,
    required this.title,
  }) : super(key: key);
  final String? title, description, imageLink;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DrawHalfCircle(),
        Container(
          child: Column(
            children: [
              const Spacer(flex: 5),

              const Spacer(flex: 3,),
              Image.asset(
                imageLink!,
                height: getProportionateScreenHeight(300),
                width: getProportionateScreenHeight(300),
              ),
              const Spacer(
                flex: 4,
              ),

              ///===============================================
              /// title
              Text(
                title!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              const Spacer(
                flex: 2,
              ),

              ///===================================================
              /// description
              Center(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Text(description!, textAlign: TextAlign.center),
              )),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
