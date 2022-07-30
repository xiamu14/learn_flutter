import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';

List<Color> gradientColors = [primary];

LineChartData sleepData() {
  return LineChartData(
    gridData: FlGridData(
      show: false,
    ),
    titlesData: FlTitlesData(
        show: false,
        leftTitles: SideTitles(
          showTitles: false,
        ),
        rightTitles: SideTitles(
          showTitles: false,
        )),
    borderData: FlBorderData(
      show: false,
    ),
    minX: 0,
    maxX: 11,
    minY: 0,
    maxY: 6,
    lineBarsData: [
      LineChartBarData(
        spots: [
          const FlSpot(0, 3),
          const FlSpot(2.6, 2),
          const FlSpot(4.9, 5),
          const FlSpot(6.8, 3.1),
          const FlSpot(8, 4),
          const FlSpot(9.5, 3),
          const FlSpot(11, 4),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: [
          const FlSpot(0, 1),
          const FlSpot(3.8, 2.2),
          const FlSpot(5.11, 5.2),
          const FlSpot(6.10, 3.3),
          const FlSpot(8.2, 4.2),
          const FlSpot(9.5, 3),
          const FlSpot(11.2, 4.2),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: [
          const FlSpot(0.4, 3.9),
          const FlSpot(3.2, 2.6),
          const FlSpot(5.16, 5.6),
          const FlSpot(6.12, 3.9),
          const FlSpot(8.6, 4.6),
          const FlSpot(9.9, 3.5),
          const FlSpot(11.6, 4.6),
        ],
        isCurved: true,
        colors: gradientColors,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: [
          const FlSpot(0, 1.5),
          const FlSpot(2.5, 1),
          const FlSpot(3, 5),
          const FlSpot(5, 2),
          const FlSpot(7, 4),
          const FlSpot(8, 3),
          const FlSpot(11, 4),
        ],
        isCurved: true,
        colors: [thirdColor],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: [
          const FlSpot(0.2, 2.5),
          const FlSpot(2.7, 2),
          const FlSpot(3.3, 5.3),
          const FlSpot(5.3, 2.3),
          const FlSpot(7.3, 4.3),
          const FlSpot(8.3, 3.3),
          const FlSpot(11.3, 4.3),
        ],
        isCurved: true,
        colors: [thirdColor],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: [
          const FlSpot(0.7, 2.7),
          const FlSpot(2.7, 2.7),
          const FlSpot(3.7, 5.7),
          const FlSpot(5.7, 2.7),
          const FlSpot(7.7, 4.7),
          const FlSpot(8.7, 3.7),
          const FlSpot(11.7, 4.7),
        ],
        isCurved: true,
        colors: [thirdColor],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
      ),
    ],
  );
}
