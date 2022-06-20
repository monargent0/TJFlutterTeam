import 'package:beepbeep_app/predict/resultPredict.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// d-2, d-1, d-day 선택하는 페이지
class SelectPredictPage extends StatefulWidget {
  final Map busers;
  const SelectPredictPage({Key? key, required this.busers}) : super(key: key);

  @override
  State<SelectPredictPage> createState() => _SelectPredictPageState();
}

class _SelectPredictPageState extends State<SelectPredictPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png",
            width: 180),
            // const Text(
            //   "서울에서 대전으로 언제 ?",
            //   textAlign: TextAlign.right,
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            // ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Dday2');
              },
              child: const Text(
                '설날 전전날 출발 >',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[100],
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Dday1');
              },
              child: const Text(
                '설날 전날 출발 >',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                   fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[100],
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Dday');
              },
              child: const Text(
                '설날 당일 출발 >',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                   fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[100],
                fixedSize: const Size(300, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
