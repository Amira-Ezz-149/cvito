import 'package:cvito/some_helpers/constants/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    // Color(0xff8C1D18),
    Colors.red,
    Colors.red.shade400,
  ];

  LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 3,
        minY: 0,
        maxY: 5,
        titlesData: LineTitles.getTitleData(),
        gridData: FlGridData(
          show: true,

          ///draw horizontal lines in graph
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.shade400,
              strokeWidth: 1,
            );
          },

          ///draw vertical lines in graph
          drawVerticalLine: true,
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Colors.grey.shade400,
              strokeWidth: 1,
            );
          },
        ),
        lineBarsData: [
          LineChartBarData(
              spots: [
                const FlSpot(0, 0),
                const FlSpot(1, 1),
                const FlSpot(1.5, 1.5),
                const FlSpot(2, 2.5),
                const FlSpot(2.5, 3.4),
                const FlSpot(3, 4.5),
              ],
              isCurved: false,
              colors: gradientColors,

              ///stroke of the curve
              barWidth: 1.5,
              belowBarData: BarAreaData(
                  show: true,
                  colors: gradientColors
                      .map((color) => color.withOpacity(0.3))
                      .toList()))
        ],
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey.shade400, width: 1),
        ),
      ),
    );
  }
}

class LineTitles {
  static getTitleData() => FlTitlesData(
        show: true,

        ///bottom titles
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,

          ///text style for bottom titles
          getTextStyles: (BuildContext context, double value) {
            return const TextStyle(
                color: kCustomBlack,
                fontWeight: FontWeight.w400,
                fontSize: 12.0);
          },

          /// define the bottom titles
          getTitles: (value) {
            switch (value.toInt()) {
              case 0:
                return 'JAN';
              case 1:
                return 'MAR';
              case 2:
                return 'MAY';
              case 3:
                return 'AUG';
            }
            return '';
          },
          margin: 10.0,
        ),

        ///left titles
        leftTitles: SideTitles(
          showTitles: true,
          margin: 22,
          reservedSize: 30,

          ///text style for left titles
          getTextStyles: (BuildContext context, double value) {
            return const TextStyle(
                color: kCustomBlack,
                fontWeight: FontWeight.w400,
                fontSize: 12.0);
          },

          /// define the left titles
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1000';
              case 2:
                return '2000';
              case 3:
                return '3000';
              case 4:
                return '4000';
              case 5:
                return '5000';
            }
            return '';
          },
        ),

        /// top titles
        topTitles: SideTitles(
          showTitles: false,
        ),

        ///right titles
        rightTitles: SideTitles(
          showTitles: false,
          margin: 22,
        ),
      );
}
