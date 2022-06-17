import 'package:beepbeep_app/main/resultPredict.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// d-2, d-1, d-day 선택하는 페이지
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const ResultPredict()
                ));
              },
              child: const Text('설날 전전날 출발 >'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 16, 134, 224),
                minimumSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                  // 버튼 모서리 조절
                  
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                //
              },
              child: const Text('설날 전날 출발 >'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 16, 134, 224),
                minimumSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                  // 버튼 모서리 조절
                  
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) => const DDay()
                // ));
              },
              child: const Text('설날 당일 출발 >'),
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 16, 134, 224),
                minimumSize: const Size(200, 40),
                shape: RoundedRectangleBorder(
                  // 버튼 모서리 조절
                  
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
