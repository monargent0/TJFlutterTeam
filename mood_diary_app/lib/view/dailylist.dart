import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DailyList extends StatefulWidget {
  const DailyList({Key? key}) : super(key: key);

  @override
  State<DailyList> createState() => _DailyListState();
}

class _DailyListState extends State<DailyList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('-'),
        backgroundColor: Colors.brown[100],
        elevation: 0,
      ),
    );
  }
}