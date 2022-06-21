import 'dart:convert';

import 'package:beepbeep_app/login/loginPage.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _nameController;
  late TextEditingController _idController;
  late TextEditingController _emailController;
  late TextEditingController _pwController;
  late TextEditingController _pwokController;

  late String? _idErrorText;
  late String? _emailErrorText;
  late String? _passErrorText;
  late String? _pass2ErrorText;

  late bool isRegistering;

  @override
  void initState() {
    _nameController = TextEditingController();
    _idController = TextEditingController();
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    _pwokController = TextEditingController();

    _idErrorText = null;
    _emailErrorText = null;
    _passErrorText = null;
    _pass2ErrorText = null;

    isRegistering = false;
    super.initState();
  }

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    _pwokController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.deepPurple,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          '회원가입',
          style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/logo.png'),
                  radius: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: '닉네임',
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    labelText: '아이디',
                    errorText: _idErrorText,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: '이메일',
                    errorText: _emailErrorText,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _pwController,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    errorText: _passErrorText,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _pwokController,
                  decoration: InputDecoration(
                    labelText: '비밀번호 확인',
                    errorText: _pass2ErrorText,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 2, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        fixedSize: const Size(140, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.deepPurple),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '뒤로가기',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        fixedSize: const Size(140, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        registOk();
                      },
                      child: const Text(
                        '가입하기',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
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
    );
  }

  // ---Fuction
  registOk() async {
    setState(() {
      isRegistering = true;
    });

    // 정규식 적용
    RegExp idReg = RegExp(r"^[0-9a-zA-Z]*$"); // 영문 + 숫자 + 길이 제한X
    RegExp emailReg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    RegExp pwReg =
        RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (!idReg.hasMatch(_idController.text.trim())) {
      setState(() {
        _idErrorText = 'ID 형식에 맞추어주세요';
      });
    } else {
      var url = Uri.parse(
          'http://localhost:8080/Flutter/beep_idCheck.jsp?buid=${_idController.text.trim()}');
      var response = await http.get(url);
      var dataConvertedJSON = jsonDecode(utf8.decode(response.bodyBytes));
      bool isIdExist = dataConvertedJSON['results'];
      print(isIdExist);

      if (isIdExist) {
        setState(() {
          _idErrorText = '이미 존재하는 ID입니다.';
        });
      } else {
        setState(() {
          _idErrorText = null;
        });

        //이메일 체크
        if (!emailReg.hasMatch(_emailController.text.trim())) {
          setState(() {
            _emailErrorText = '유효한 이메일을 입력해주세요';
          });
        } else {
          setState(() {
            _emailErrorText = null;
          });
        }

        //패스워드 체크
        if (!pwReg.hasMatch(_pwController.text.trim())) {
          setState(() {
            _passErrorText = '영문 + 숫자 + 특수문자 8자 이상으로 입력해주세요';
          });
        } else {
          setState(() {
            _passErrorText = null;
          });

          //패스워드 다시 확인
          if (_pwokController.text != _pwController.text) {
            setState(() {
              _pass2ErrorText = '비밀번호 확인이 일치하지 않습니다.';
            });
          } else {
            setState(() {
              _pass2ErrorText = null;
            });

            //통과
            var url = Uri.parse(
                'http://localhost/Flutter/beep_regist.jsp?buid=${_idController.text.trim()}&upw=${_pwController.text.trim()}&uname=${_nameController.text.trim()}&uemail=${_emailController.text.trim()}');
            var response = await http.get(url);
            var dataConvertedJSON = jsonDecode(utf8.decode(response.bodyBytes));
            bool isSuccess = dataConvertedJSON['results'];
            // print(isSuccess);
            if (isSuccess) {
              setState(() {
                _showDialog(context);
              });
            }
          }
        }
      }
    }
    setState(() {
      isRegistering = false;
    });
  }

  _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Icon(
              Icons.task_alt,
              color: Colors.deepPurple,
            ),
            content: const Text('         가입이 완료 되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text('확인'),
              ),
            ],
          );
        });
  }
} // End
