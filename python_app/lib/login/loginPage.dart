import 'dart:convert';

import 'package:beepbeep_app/tabPage.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'searchMain.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController buid; // 아이디 입력창 컨트롤러
  late TextEditingController bpw; // 비번 입력창 컨트롤러
  late List busers;

  // JSON
  late String id;
  late String pw;

  @override
  void initState() {
    super.initState();
    busers = [];
    buid = TextEditingController();
    bpw = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // 화면 터치시 언포커스
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
                    height: 100,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('images/logo.png'),
                    radius: 50,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset('images/beeplogo.png'),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    '서울-대전 교통 예측 서비스',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // 아이디 입력
                    width: 300,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextField(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        controller: buid,
                        decoration: const InputDecoration(
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
                  SizedBox(
                    // 비밀번호 입력
                    width: 300,
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextField(
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        controller: bpw,
                        decoration: const InputDecoration(
                          hintText: "비밀번호",
                          hintStyle: TextStyle(color: Colors.deepPurple),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true, // 입력시 암호 모드 ** 로 표시
                        autocorrect: false, // 자동완성 해제
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    // 로그인 버튼
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple,
                      fixedSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // 사용자 입력 값 JSON용 변수에 넣어줌
                      id = buid.text.trim();
                      pw = bpw.text.trim();

                      // 공백 있으면 에러스낵바 아니면 쿼리문 작동
                      if (buid.text.trim().isEmpty || bpw.text.trim().isEmpty) {
                        errorSnackbar(context);
                      } else {
                        loginAction();
                      }
                    },
                    child: const Text(
                      '로그인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    // 회원가입 버튼
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size(300, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(color: Colors.deepPurple),
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
                  Row(
                    // 아이디 비밀번호 찾기
                    children: [
                      const SizedBox(
                        width: 100,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchMainPage()));
                        },
                        child: const Text(
                          '아이디찾기',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Text(
                        '|',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SearchMainPage()));
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
  }
  //--- Function

  // 공백 에러창
  errorSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('아이디와 비밀번호를 입력해주세요.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.deepPurple,
    ));
  }

// 로그인 실패 에러창
  loginfailSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('아이디와 비밀번호가 일치하지 않습니다.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.deepPurple,
    ));
  }

// 탈퇴 계정 에러창
  taltoeSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('탈퇴한 계정입니다.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.deepPurple,
    ));
  }

  // Login
  // 택스트필드에서 id,pw를 받아와서 로그인 버튼을 누르면 실행된다.
  // DB 다녀와서 계정이 없으면 알림창, 계정이 있으면 다음 화면으로 바로 넘어가기

  Future<bool> loginAction() async {
    busers = []; // 초기화
    var url = Uri.parse(
        'http://localhost:8080/Flutter/beep_login.jsp?buid=$id&upw=$pw'
        // get 방식으로 데이터 받아와서 넘기기
        );
    var response = await http.get(url);

    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];

    setState(() {
      if (result[0] == 'ERROR') {
        // print(result); // 결과 확인용
        loginfailSnackbar(context); // 로그인 실패 알림창
      } else if (result[0] == 'TALTOE') {
        taltoeSnackbar(context); // 탈퇴 계정 알림창
      } else {
        busers.addAll(result);

        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return TabPage(
                busers: busers[0],
              );
            },
          ),
        ); // 로그인 성공 메인 화면으로 이동
      }
      // print(busers[0]); // 결과 확인용
    });

    return true;
  } // Login
// Login

} // End
