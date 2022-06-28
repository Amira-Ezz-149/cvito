import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:flutter/material.dart';


///used in Related Screen
class CompanyCard extends StatelessWidget {
  String imageLink;
  double? logoScale;

  CompanyCard({required this.imageLink, required this.logoScale});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: kBasicColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade200),
        //linkedin = 1
        //facebook = 2
        image: DecorationImage(scale: logoScale!,
          fit: BoxFit.scaleDown,
          image: AssetImage(imageLink),
        ),
      ),
    );
  }
}
