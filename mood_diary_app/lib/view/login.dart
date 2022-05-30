import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController eId;
  late TextEditingController ePw;

  @override
  void initState() {
    super.initState();
    eId = TextEditingController();
    ePw = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/loginpage.png'), fit: BoxFit.cover)),
        child: Column(
          children: [
            const SizedBox(
              height: 400,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: eId,
                decoration: const InputDecoration(labelText: "아이디를 입력하세요"),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: TextField(
                controller: ePw,
                decoration: const InputDecoration(labelText: "비밀번호를 입력하세요"),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(400, 60),
                      primary: Color.fromARGB(255, 119, 216, 164),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      if (eId.text.trim().isEmpty || ePw.text.trim().isEmpty) {
                        errorSnackbar(context);
                      } else if (eId.text != 'root' || ePw.text != 'qwer1234') {
                        errorSnackbar2(context);
                      } else if (eId.text == 'root' || ePw.text == 'qwer1234') {
                        _showDialog(context);
                      }
                    },
                    child: const Text(
                      '로 그 인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  errorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('아이디와 비밀번호를 입력해주세요.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  errorSnackbar2(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('아이디와 비밀번호가 일치하지 않습니다.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.orange,
    ));
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Icon(
              Icons.task_alt_rounded,
              size: 34,
              color: Color.fromRGBO(83, 151, 253, 100),
            ),
            content: const Text('로그인 되었습니다.'),
            actions: [
              Center(
                child: TextButton(
                  child: const Text('확인'),
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ));
                  },
                ),
              ),
            ],
          );
        });
  }
} //END