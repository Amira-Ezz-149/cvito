import 'package:cvito/constants/constants.dart';
import 'package:cvito/constants/sized_config.dart';
import 'package:cvito/layout/widgets/country_label_performance.dart';
import 'package:flutter/material.dart';

class CountryContainer extends StatelessWidget {
  CountryContainer({
    required this.height,
    required this.title,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4,
    required this.labelColor1,
    required this.labelColor2,
    required this.labelColor3,
    required this.labelColor4,
  });

  final double height;
  final String label1, label2, label3, label4, title;

  final Color labelColor1, labelColor2, labelColor3, labelColor4;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      height: getProportionateScreenHeight(300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 8.0,
              bottom: 10.0,
            ),
            child: Text(
              title,
              style: const TextStyle(
                  color: kCustomBlack,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                CountryLabelPerformance(
                    countryLabel: label1, iconColor: labelColor1),
                const Spacer(),
                CountryLabelPerformance(
                    countryLabel: label2, iconColor: labelColor2),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                CountryLabelPerformance(
                    countryLabel: label3, iconColor: labelColor3),
                const Spacer(),
                CountryLabelPerformance(
                    countryLabel: label4, iconColor: labelColor4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
