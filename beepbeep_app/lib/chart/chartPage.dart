import 'package:flutter/material.dart';

class ChartPage extends StatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  State<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends State<ChartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: () {
              //
            }, child: const Text('년도 별 인구'))
          ],
        ),
      ),
      appBar: AppBar(
        title: Image.asset('images/logo.png'),
        backgroundColor: Colors.white,
        elevation: 0, 
      ),
    );
  }
}