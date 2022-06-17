import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ResultPredict extends StatefulWidget {
  const ResultPredict({Key? key}) : super(key: key);

  @override
  State<ResultPredict> createState() => _ResultPredictState();
}

class _ResultPredictState extends State<ResultPredict> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '소요 예상 시간'
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    '1시간 30분(예시)',
                    style: TextStyle(fontSize: 40),
                    ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                const Text('내가 입력한 정보'),
                SizedBox(
                  width: 50,
                ),
                Text(
                  '나의 이력에서 조회 가능',
                  style: TextStyle(fontSize: 5),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}