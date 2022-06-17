import 'dart:convert';

import 'package:beepbeep_app/login/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController buid;
  late TextEditingController bpw;
  // late List busers;

  // JSON
  late String id;
  late String pw;

  @override
  void initState() {
    super.initState();
    // busers = [];
    buid = TextEditingController();
    bpw = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width, // 배경사진 화면 꽉 차게
            height: MediaQuery.of(context).size.height, // 배경사진 화면 꽉 차게
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/login.png'), fit: BoxFit.fill),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/logo.png'),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SizedBox(
                    width: 300,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextField(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        // controller: uId,
                        decoration: InputDecoration(
                          hintText: "아이디",
                          hintStyle: TextStyle(color: Colors.deepPurple),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        autocorrect: false, // 자동완성 해제
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 300,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextField(
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        // controller: uPw,
                        decoration: InputDecoration(
                          hintText: "비밀번호",
                          hintStyle: TextStyle(color: Colors.deepPurple),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        autocorrect: false, // 자동완성 해제
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.deepPurple),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      '회원가입',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      fixedSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      //
                    },
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 100,
                      ),
                      TextButton(
                        onPressed: () {
                          //
                        },
                        child: const Text(
                          '아이디찾기',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        '|',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          //
                        },
                        child: const Text(
                          ' 비밀번호찾기',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  } //--- Function

  // 공백 에러창
  errorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('아이디와 비밀번호를 입력해주세요.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

// 로그인 실패 에러창
  loginfailSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('아이디와 비밀번호가 일치하지 않습니다.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.orange,
    ));
  }

  // Login
  // 택스트필드에서 id,pw를 받아와서 로그인 버튼을 누르면 실행된다.
  // DB 다녀와서 계정이 없으면 알림창, 계정이 있으면 다음 화면으로 바로 넘어가기

  // Future<bool> updateAction() async {
  //   busers = []; // 초기화
  //   var url = Uri.parse(
  //       'http://192.168.5.83:8080/Flutter/beep_login.jsp?buid=$id&bpw=$pw'
  //       // get 방식으로 데이터 받아와서 넘기기
  //       );
  //   var response = await http.get(url);

  //   var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
  //   List result = dataConvertedJSON['results'];

  //   setState(() {
  //     if (result[0] == 'ERROR') {
  //       // print(result); // 결과 확인용
  //       loginfailSnackbar(context); // 로그인 실패 알림창
  //     } else {
  //       busers.addAll(result);
  //       // print(users); // 결과 확인용

  //       Navigator.pop(context);
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) {
  //             return RegisterPage(users: busers[0]); // Map으로 보내
  //           },
  //         ),
  //       ); // 로그인 성공 리스트 화면으로 이동
  //     }
  //   });

  //   return true;
  // } // Login

} // End
