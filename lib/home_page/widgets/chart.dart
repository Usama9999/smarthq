import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomChart extends StatefulWidget {
  const CustomChart({super.key});

  @override
  State<CustomChart> createState() => _CustomChartState();
}

class _CustomChartState extends State<CustomChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(2010, 35),
      ChartData(2011, 28),
      ChartData(2012, 34),
      ChartData(2013, 32),
      ChartData(2014, 40)
    ];
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryYAxis: NumericAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      //Hide the axis line of y-axis
                    ),
                    series: <ChartSeries>[
          // Renders area chart
          AreaSeries<ChartData, int>(
              color: Color(0xFF97D700).withOpacity(0.4),
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ]))));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final int x;
  final double y;
}
