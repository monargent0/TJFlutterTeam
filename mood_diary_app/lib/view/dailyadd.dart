import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DailyAdd extends StatefulWidget {
  final String uID;
  const DailyAdd({Key? key, required this.uID}) : super(key: key);

  @override
  State<DailyAdd> createState() => _DailyAddState();
}

class _DailyAddState extends State<DailyAdd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('My Mood'),
        backgroundColor: Colors.grey[100],
        foregroundColor: Colors.brown,
        elevation: 0,
      ),
    );
  }
}
