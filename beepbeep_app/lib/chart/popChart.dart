import 'package:flutter/material.dart';
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:charts_flutter/flutter.dart' as charts;

// class PopChart extends StatefulWidget {
//   final List<charts.Series<dynamic, num>> seriesList;
//   final bool animate;

//   const PopChart({Key? key, required this.seriesList, required this.animate}) : super(key: key);

//   @override
//   State<PopChart> createState() => _PopChartState();
// }

// List<charts.Series<XY, int>> _createChartData(){
//   return [
//     charts.Series<XY, int>(
//       id: 'Populations',
//       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//       domainFn: (XY xy, _) => XY.X,
//     )
//   ];
// }

// class _PopChartState extends State<PopChart> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: charts.LineChart(widget.seriesList, animate: widget.animate),
//       ),
//     );
//   }
// }



// class PopChart extends StatelessWidget {
//   static List<charts.Series<LinearSales, int>> _createSampleData() {
//     return [
//       charts.Series<LinearSales, int>(
//         id: 'Sales',
//         colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//         domainFn: (LinearSales sales, _) => sales.year,
//         measureFn: (LinearSales sales, _) => sales.sales,
//         data: data,
//       )
//     ];
//   }
// }


class XY {
  final int X;
  final int Y;

  XY(this.X, this.Y);
}