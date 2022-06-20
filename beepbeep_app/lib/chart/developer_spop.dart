import 'package:beepbeep_app/chart/developer_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class DeveloperPop extends StatelessWidget {
  final List<DeveloperData> data;
  const DeveloperPop({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<charts.Series<DeveloperData, String>> series = [
      charts.Series(
          id: "developers",
          data: data,
          domainFn: (DeveloperData series, _) => series.x.toString(),
          measureFn: (DeveloperData series, _) => series.y,
          colorFn: (DeveloperData series, _) => series.barColor)
    ];

    return SizedBox(
      height: 400,
      // color: Colors.pink[50],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // const Text(
                //   '2013 ~ 2020년 서울 인구수',
                //   style: TextStyle(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                Expanded(
                  child: charts.BarChart(
                    series,
                    animationDuration: const Duration(milliseconds: 900),
                    animate: true,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
