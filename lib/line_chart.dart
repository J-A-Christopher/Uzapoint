import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:uza_point/price_point.dart';

class LineChartWidget extends StatelessWidget {
  final List<PricePoint> points;
  const LineChartWidget({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(LineChartData(lineBarsData: [
        LineChartBarData(
            spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
            isCurved: false,
            dotData: const FlDotData(show: true))
      ])),
    );
  }
}
