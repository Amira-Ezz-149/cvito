import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


//TODO : change percentage
class MySlider extends StatelessWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      animateFromLastPercent: true,
      animation: true,
      animationDuration:700,
      radius: 100.0,
      lineWidth: 13.0,
      backgroundWidth: -1.0,
      percent: 0.80,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '80%',
            style: TextStyle(
              letterSpacing: 1,
              fontSize: 45.0,
              color: Colors.black,
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.grey.shade300,
                  offset: const Offset(0.0, 0.5),
                ),
              ],
            ),
          ),
          Text(
            '\$15,000 / week',
            style: TextStyle(
                fontSize: 15.0, fontWeight: FontWeight.bold,

              shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.grey.shade300,
                offset: const Offset(0.0, 0.5),
              ),
            ], ),
          )
        ],
      ),
      //
      progressColor: const Color(0xff0077b5),
      backgroundColor: Colors.grey.shade300,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
