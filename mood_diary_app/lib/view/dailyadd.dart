import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DailyAdd extends StatefulWidget {
  const DailyAdd({Key? key}) : super(key: key);

  @override
  State<DailyAdd> createState() => _DailyAddState();
}

class _DailyAddState extends State<DailyAdd> {
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