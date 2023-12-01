import 'package:flutter/material.dart';
import 'package:smarthq/utils/styles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData('JAN', 50),
      _ChartData('FEB', 40),
      _ChartData('MAR', 30),
      _ChartData('APR', 12),
      _ChartData('MAY', 40),
      _ChartData('JUN', 25),
      _ChartData('JUL', 9),
      _ChartData('AUG', 20),
      _ChartData('SEP', 30),
      _ChartData('OCT', 35),
      _ChartData('NOV', 15),
      _ChartData('DEC', 25),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(labelStyle: normalText(size: 8)),
        primaryYAxis: NumericAxis(),
        tooltipBehavior: _tooltip,
        series: <ChartSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Gold',
              color: Color(0xFF97D700)),
          ColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y - 3,
              name: 'Titanium',
              color: Color(0xFF0077C8)),
          ColumnSeries<_ChartData, String>(
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y + 3,
              name: 'Titanium',
              color: Color(0xFFF2A900))
        ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
