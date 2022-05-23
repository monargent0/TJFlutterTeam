import 'package:flutter/material.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  late TextEditingController height;
  late TextEditingController weight;

  late String imageName;

  @override
  void initState() {
    height = TextEditingController()
      ..addListener(() {
        _calc();
      });
    weight = TextEditingController()
      ..addListener(() {
        _calc();
      });
    imageName = 'main.png';

    super.initState();
  }

  void _calc() {
    setState(() {
      if (height.text.trim().isEmpty | weight.text.trim().isEmpty) {
        imageName = 'main.png';
      } else {
        double bmi = (int.parse(weight.text.trim()) /
            (int.parse(height.text.trim()) *
                int.parse(height.text.trim()) /
                10000));
        if (bmi < 18.5) {
          imageName = 'd-0.png';
        } else if (bmi < 24.9) {
          imageName = 'd-1.png';
        } else if (bmi < 29.9) {
          imageName = 'd-2.png';
        } else if (bmi < 34.9) {
          imageName = 'd-3.png';
        } else {
          imageName = 'd-4.png';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'BMI 계산기',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 80,
            ),
            TextField(
              decoration: const InputDecoration(labelText: '당신의 키는 몇 cm 인가요?'),
              keyboardType: TextInputType.number,
              controller: height,
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              decoration:
                  const InputDecoration(labelText: '당신의 몸무게는 몇 kg 인가요?'),
              keyboardType: TextInputType.number,
              controller: weight,
            ),
            const SizedBox(
              height: 40,
            ),
            if (imageName == 'd-main.png') ...[
              Image.asset('images/$imageName')
            ] else ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/$imageName',
                    width: 180,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '당신의 BMI',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '${(int.parse(weight.text.trim()) / (int.parse(height.text.trim()) * int.parse(height.text.trim()) / 100000)).round() / 10}',
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              )
            ],
          ]),
        ),
      ),
    );
  }
}
