import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _pw1Controller;
  late TextEditingController _pw2Controller;

  late String? _idErrorText;
  late String? _nameErrorText;
  late String? _passErrorText;
  late String? _pass2ErrorText;

  late bool isRegistering;

  @override
  void initState() {
    _idController = TextEditingController();
    _nameController = TextEditingController();
    _pw1Controller = TextEditingController();
    _pw2Controller = TextEditingController();

    _idErrorText = null;
    _nameErrorText = null;
    _passErrorText = null;
    _pass2ErrorText = null;

    isRegistering = false;

    super.initState();
  }

  @override
  void dispose() {
    _idController.dispose();
    _pw1Controller.dispose();
    _pw2Controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: const Text(
          'SIGN UP',
          style: TextStyle(
              color: Color.fromARGB(255, 119, 216, 164),
              fontWeight: FontWeight.bold,
              fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: '이름 / 닉네임',
                  errorText: _nameErrorText,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 119, 216, 164)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.text,
                autocorrect: false,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _idController,
                decoration: InputDecoration(
                  hintText: '이메일 주소',
                  errorText: _idErrorText,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 119, 216, 164)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _pw1Controller,
                decoration: InputDecoration(
                  hintText: '비밀번호',
                  errorText: _passErrorText,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 119, 216, 164)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _pw2Controller,
                decoration: InputDecoration(
                  hintText: '비밀번호 확인',
                  errorText: _pass2ErrorText,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        width: 2, color: Color.fromARGB(255, 119, 216, 164)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 2, color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
              const SizedBox(
                height: 100,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: isRegistering
                      ? Colors.grey
                      : const Color.fromARGB(255, 119, 216, 164),
                  fixedSize: const Size(300, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  if (!isRegistering) {
                    checkRegist();
                  } else {
                    
                    print('registering');
                  }
                },
                child: Text(
                  isRegistering ? '가입 중' : '회  원  가  입',
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//---- Function
  checkRegist() async {
    setState(() {
      isRegistering = true;
    });

    //이름 체크
    RegExp nameReg = RegExp(r"^[가-힣]{2,6}$");
    RegExp emailReg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    RegExp passReg =
        RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (!nameReg.hasMatch((_nameController.text.trim()))) {
      setState(() {
        _nameErrorText = '2~6자의 한글 이름을 입력해주세요';
      });
    } else {
      setState(() {
        _nameErrorText = null;
      });

      //이메일 체크
      if (!emailReg.hasMatch(_idController.text.trim())) {
        setState(() {
          _idErrorText = '유효한 이메일을 입력해주세요';
        });
      } else {
        var url = Uri.parse(
            'http://localhost:8080/Flutter/idCheck.jsp?id=${_idController.text.trim()}');
        var response = await http.get(url);
        var dataConvertedJSON = jsonDecode(utf8.decode(response.bodyBytes));
        bool isIdExist = dataConvertedJSON['results'];

        if (isIdExist) {
          setState(() {
            _idErrorText = '이미 존재하는 ID입니다.';
          });
        } else {
          setState(() {
            _idErrorText = null;
          });

          //패스워드 체크
          if (!passReg.hasMatch(_pw1Controller.text.trim())) {
            setState(() {
              _passErrorText = '영문, 숫자, 특수문자를 포함해 8자 이상으로 입력해주세요';
            });
          } else {
            setState(() {
              _passErrorText = null;
            });

            //패스워드2 체크
            if (_pw1Controller.text.trim() != _pw2Controller.text.trim()) {
              setState(() {
                _pass2ErrorText = '비밀번호 확인이 일치하지 않습니다.';
              });
            } else {
              setState(() {
                _pass2ErrorText = null;
              });
              //통과

              var url = Uri.parse(
                  'http://localhost:8080/Flutter/regist.jsp?uid=${_idController.text.trim()}&upw=${_pw1Controller.text.trim()}&uname=${_nameController.text.trim()}');
              var response = await http.get(url);
              var dataConvertedJSON =
                  jsonDecode(utf8.decode(response.bodyBytes));
              bool isSuccess = dataConvertedJSON['results'];
              // print(isSuccess);
            }
          }
        }
      }
    }
    setState(() {
      isRegistering = false;
    });
  }
}
