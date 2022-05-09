import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  late List<_ChartData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = <_ChartData>[
      _ChartData('Jan', 35),
      _ChartData('Feb', 28),
      _ChartData('Mar', 34),
      _ChartData('Apr', 32),
      _ChartData('May', 40)
    ];
    _tooltipBehavior = TooltipBehavior(
        enable: true,
        builder: (dynamic data, dynamic point, dynamic series, int pointIndex,
            int seriesIndex) {
          return SizedBox(child: SvgPicture.asset('assets/circle.svg'));
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCartesianChart(
            tooltipBehavior: _tooltipBehavior,
            primaryXAxis: CategoryAxis(),
            series: <ChartSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
            dataSource: _chartData,
            xValueMapper: (_ChartData data, _) => data.year,
            yValueMapper: (_ChartData data, _) => data.sales,
          )
        ]));
  }
}

class _ChartData {
  _ChartData(this.year, this.sales);

  final String year;
  final double sales;
}
