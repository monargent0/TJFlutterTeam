import 'package:flutter/material.dart';
import 'jung_massage.dart';

class JungInput extends StatefulWidget {
  const JungInput({Key? key}) : super(key: key);

  @override
  State<JungInput> createState() => _JungInputState();
}

class _JungInputState extends State<JungInput> {
  late TextEditingController kg;
  late TextEditingController tall;

  @override
  void initState() {
    kg = TextEditingController();
    tall = TextEditingController();
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
          title: const Text('내 정보 입력'),
          backgroundColor: Colors.amber[100],
          elevation: 0,
          foregroundColor: Colors.blueGrey,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset(
                      'images/shh.png',
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const Text(
                    '쉿! 아무도 못보게 얼른 입력해주세요! ',
                    style: TextStyle(fontSize: 17, color: Colors.blueGrey),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  SizedBox(
                    width: 260,
                    child: TextField(
                      controller: tall,
                      decoration: const InputDecoration(
                        labelText: " 키(cm)를 입력해 주세요!",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple),
                        ),
                      ),
                      keyboardType:
                          TextInputType.number, // number 숫자만 입력 . 기본타입은 Text
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 260,
                    child: TextField(
                      controller: kg,
                      decoration: const InputDecoration(
                        labelText: " 체중(Kg) 을 입력해 주세요!",
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 1, color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 1, color: Colors.purple),
                        ),
                      ),
                      keyboardType:
                          TextInputType.number, // number 숫자만 입력 . 기본타입은 Text
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Massage.kg = kg.text;
                      Massage.tall = tall.text;
                      if (kg.text.trim().isEmpty || tall.text.trim().isEmpty) {
                        errorSnackBar(context);
                      } else {
                        Navigator.pushNamed(context, '/result');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                    ),
                    child: const Text('계산하기'),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // 얘는 화면에서 고정
          onPressed: () => _showDialog(context),
          backgroundColor: Colors.amber,
          child: const Icon(Icons.add_alert),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('BMI 지수 계산 공식'),
            content: const Text('* BMI지수 = 체중(Kg) / 신장^2(m) *'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('확인!'))
            ],
          );
        });
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('아직 입력하지 않은 값이 있어요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
