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
              Navigator.pushNamed(context, '/spop');
            }, child: const Text('년도 별 인구')),
            TextButton(onPressed: () {
              Navigator.pushNamed(context, '/total');
            }, child: const Text('전체 데이터')),
          ],
        ),
      ),
      appBar: AppBar(
        title: Image.asset('images/beeplogo.png'),
        backgroundColor: Colors.white,
        elevation: 0, 
      ),
    );
  }
}