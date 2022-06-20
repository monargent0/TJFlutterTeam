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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/spop');
            }, child: const Text('년도 별 인구')),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/traffic1');
            }, child: const Text('1종 교통량')),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/traffic2');
            }, child: const Text('2종 교통량')),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/spop');
            }, child: const Text('소요시간')),
            const SizedBox(height: 12,),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/total');
            }, child: const Text('전체 데이터')),
            TextButton(onPressed: () {
              Navigator.pushNamed(context, '/time');
            }, child: const Text('소요시간 데이터')),
          ],
        ),
      ),
    );
  }
}