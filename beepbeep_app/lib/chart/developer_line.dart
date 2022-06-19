import 'package:beepbeep_app/chart/developer_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DeveloperTime extends StatelessWidget {
  final List<DeveloperData> data;
  final String title;
  const DeveloperTime({Key? key, required this.data, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperData, num>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperData series, _) => series.x,
          measureFn: (DeveloperData series, _) => series.y,
          colorFn: (DeveloperData series, _) => series.barColor)
    ];

    return SizedBox(
      height: 500,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: charts.LineChart(
                    series,
                    animationDuration: const Duration(seconds: 3),
                    domainAxis: const charts.NumericAxisSpec(
                      tickProviderSpec:
                          charts.BasicNumericTickProviderSpec(zeroBound: false),
                      viewport: charts.NumericExtents(0.0, 23.0),
                    ),
                    animate: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
