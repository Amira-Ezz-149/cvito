import 'package:flutter/material.dart';
import 'package:cvito/constants/constants.dart';

class CountryLabelPerformance extends StatelessWidget {
  String? countryLabel;
  Color? iconColor;

  CountryLabelPerformance(
      {required this.countryLabel, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
            children: [
          Icon(
            Icons.bar_chart,
            color: iconColor,
          ),
          FittedBox(
            child: Text(
              countryLabel!,
              style: const TextStyle(color: kCustomBlack),
            ),
          ),
        ]),
       const Text(
          '16%',
          style: TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
