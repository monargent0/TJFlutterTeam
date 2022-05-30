import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DailyContent extends StatefulWidget {
  const DailyContent({Key? key}) : super(key: key);

  @override
  State<DailyContent> createState() => _DailyContentState();
}

class _DailyContentState extends State<DailyContent> {
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
