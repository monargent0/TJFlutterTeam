import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class myPage extends StatefulWidget {
  // fianl Map userdata;
  const myPage({Key? key}) : super(key: key);

  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  late TextEditingController _nameController;
  late TextEditingController _idController;
  late TextEditingController _emailController;
  late TextEditingController _pwController;
  late TextEditingController _pwokController;

  late String id;
  late String pw;
  late String name;
  late String email;

  late String result;

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

    // _nameController.text = widget.userdata['buid'];
    // _idController.text = widget.userdata['uname'];
    // _emailController.text = widget.userdata['uemail'];
    // _pwController.text = widget.userdata['upw'];
    // _pwokController.text = widget.userdata['upw'];

    _idErrorText = null;
    _emailErrorText = null;
    _passErrorText = null;
    _pass2ErrorText = null;

    super.initState();
  }

  @override
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
          '회원정보 수정',
          style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        leading: IconButton(
          onPressed: () {
            // Navigator.pop(context);
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
                  readOnly: true,
                  //  controller: _idController,
                  decoration: InputDecoration(
                    labelText: '아이디',
                    //  errorText: _idErrorText,
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
                  //  controller: _nameController,
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
                  //  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: '이메일',
                    //  errorText: _emailErrorText,
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
                  //  controller: _pwController,
                  decoration: InputDecoration(
                    labelText: '비밀번호',
                    //  errorText: _passErrorText,
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
                  // controller: _pwokController,
                  decoration: InputDecoration(
                    labelText: '비밀번호 확인',
                    // errorText: _pass2ErrorText,
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
                Row(children: [
                  const SizedBox(
                    width: 300,
                  ),
                  TextButton(
                    onPressed: () {
                      //
                    },
                    child: const Text(
                      '탈퇴하기',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]),
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
                        // userUpdateOk();
                        // editShowDialog();
                      },
                      child: const Text(
                        '수정하기',
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

  // ---Function

  _editShowDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Icon(
            Icons.edit_note_rounded,
            color: Colors.amber,
          ),
          content: const Text('            수정하시겠습니까?'),
          actions: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text(
                      '취소',
                      style: TextStyle(color: Colors.amber),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      userUpdateOk();
                    },
                    child: const Text('확인'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  userUpdateOk() async {
    setState(() {
      isRegistering = true;
    });

    // 정규식 적용
    RegExp emailReg = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    RegExp pwReg =
        RegExp(r'^(?=.*?[A-Za-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    var url = Uri.parse(
        'http://172.30.1.37:8080/Flutter/beep_update.jsp?&upw=$pw&uname=$name&uemail=$email&buid=$id');
    var response = await http.get(url);
    var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
    result = dataConvertedJSON['result'];
    //print(result);
    setState(() {
      if (result == 'OK') {
        _showfinishDialog(context);
      } else {
        editerrorSnackBar(context);
      }
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
      }
    }
    setState(() {
      isRegistering = false;
    }); // else
  } // async

  // 수정 완료
  _showfinishDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Icon(
              Icons.task_alt,
              color: Colors.amber,
            ),
            content: const Text('         수정이 완료되었습니다.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(context).pop();
                },
                child: const Center(child: Text('확인')),
              ),
            ],
          );
        });
  }

// 수정 실패 시 에러바
  editerrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('수정에 실패하였습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
      ),
    );
  } // End
}
