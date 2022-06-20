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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             const SizedBox(
              height: 50,
            ),
            Text('차트 선택', style: TextStyle(fontSize: 20, color: Colors.deepPurple, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 60,
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[100],
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/spop');
              },
              child: const Text(
                '년도 별 서울 인구수 추이',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[100],
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
                onPressed: () {
                  Navigator.pushNamed(context, '/traffic1');
                },
                child: const Text('시간당 년 평균 1종 교통량' ,style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),)),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[100],
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
                onPressed: () {
                  Navigator.pushNamed(context, '/traffic2');
                },
                child: const Text('시간당 년 평균 2종 교통량', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),)),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[100],
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
                onPressed: () {
                  Navigator.pushNamed(context, '/time');
                },
                child: const Text('출발 시간별 서울-대전 소요시간', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),)),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[100],
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
                onPressed: () {
                  Navigator.pushNamed(context, '/total');
                },
                child: const Text('전체 데이터 테이블', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),)),
           
          ],
        ),
      ),
    );
  }
}
