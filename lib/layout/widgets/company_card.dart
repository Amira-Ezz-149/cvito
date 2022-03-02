import 'package:cvito/constants/constants.dart';
import 'package:flutter/material.dart';


///used in Related Screen
class CompanyCard extends StatelessWidget {
  String imageLink;

  CompanyCard({required this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: kBasicColor,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey.shade200),
        image: DecorationImage(
          fit: BoxFit.scaleDown,
          image: AssetImage(imageLink),
        ),
      ),
    );
  }
}
