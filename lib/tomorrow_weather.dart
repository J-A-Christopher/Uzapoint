import 'package:flutter/material.dart';
import 'package:uza_point/line_chart.dart';
import 'package:uza_point/price_point.dart';

class TemperatureTrends extends StatelessWidget {
  const TemperatureTrends({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: LineChartWidget(
        points: pricePoints,
      ),
    );
  }
}
