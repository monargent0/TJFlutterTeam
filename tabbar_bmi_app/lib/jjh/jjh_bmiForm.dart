
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tabbar_bmi_app/jjh/jjh_message.dart';

class MeasureBmi extends StatefulWidget {
  const MeasureBmi({Key? key}) : super(key: key);

  @override
  State<MeasureBmi> createState() => _MeasureBmiState();
}

class _MeasureBmiState extends State<MeasureBmi> {
  late TextEditingController height;
  late TextEditingController weight;

  @override
  void initState() {
    height = TextEditingController();
    weight = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("BMI 측정기"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(100, 100, 100, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: height,
                  decoration: const InputDecoration(labelText: '신장(cm)을 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: weight,
                  decoration: const InputDecoration(labelText: '체중(kg)을 입력하세요'),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        

                        setState(() {
                          if (height.text.isEmpty || weight.text.isEmpty) {
                            errorSnackBar(context);
                          } else {
                           double hei = double.parse(height.text);
                           double wei = double.parse(weight.text);

                            BMI.height = hei;
                            BMI.weight = wei;
                            BMI.bmi = ((wei / (hei * hei)) * 10000);

                            if (BMI.bmi > 0 && BMI.bmi <= 18.4) {
                              BMI.resultBmi = "저체중";
                              BMI.imagePath = 'images/bmi11.png';
                            } else if (BMI.bmi <= 22.9) {
                              BMI.resultBmi = "정상";
                              BMI.imagePath = 'images/bmi22.png';
                            } else if (BMI.bmi <= 24.9) {
                              BMI.resultBmi = "과체중";
                              BMI.imagePath = 'images/bmi33.png';
                            } else if (BMI.bmi <= 29.9) {
                              BMI.resultBmi = "비만";
                              BMI.imagePath = 'images/bmi44.png';
                            } else {
                              BMI.resultBmi = "고도비만";
                              BMI.imagePath = 'images/bmi55.png';
                            }

                            Navigator.pushNamed(context, '/result');
                          }
                        });
                      },
                      child: const Text('측정하기'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.green[400]),
                      ),
                      child: const Text('뒤로가기'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
