import 'package:flutter/material.dart';
import 'package:tabbar_bmi_app/jung_massage.dart';

class Result extends StatefulWidget {
  const Result({Key? key}) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  // late double result;
  late TextEditingController resultT;
  late String txt;
  late String pic;
  late bool switchValue;

  @override
  void initState() {
    resultT = TextEditingController();
    txt = '';
    pic = 'images/clear.png';
    switchValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI 계산 결과'),
        backgroundColor: Colors.amber[100],
        elevation: 0,
        foregroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Image.asset(
                pic,
                width: 200,
                height: 350,
              ),
               const SizedBox(
                height: 40,
              ),

              SizedBox(
                width: 100,
                child: TextField(
                  controller: resultT,
                  decoration: const InputDecoration(
                    labelText: "BMI 결과",
                  ),
                  readOnly: true, // number 숫자만 입력 . 기본타입은 Text
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                txt,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 17,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () {
                  calc(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                child: const Text(
                  '결과보기',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
             
            ],
          ),
        ),
      ),
    );
  }

  calc(BuildContext context) {
    double tall = int.parse(Massage.tall) / 100;
    double result = int.parse(Massage.kg) / (tall * tall);
    resultT.text = result.toStringAsFixed(1).toString();

    if (result <= 18.4) {
      setState(() {
        txt = '저체중 입니다.\n좀 더 드셔야겠어요!';
        pic = 'images/one.png';
      });
    } else if (result <= 22.9) {
      setState(() {
        txt = '정상체중 입니다.\n아주 좋아요!';
        pic = 'images/two.png';
      });
    } else if (result <= 24.9) {
      setState(() {
        txt = '과체중 입니다.\n조금만 걸어볼까요?';
        pic = 'images/three.png';
      });
    } else if (result <= 29.9) {
      setState(() {
        txt = '비만 입니다.\n운동을 시작해 볼까요?';
        pic = 'images/four.png';
      });
    } else {
      setState(() {
        txt = '고도비만 입니다.\n건강을 위해 움직일 때에요!';
        pic = 'images/five.png';
      });
    }
  }
}//