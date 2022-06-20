import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchIdPage extends StatefulWidget {
  const SearchIdPage({Key? key}) : super(key: key);

  @override
  State<SearchIdPage> createState() => _SearchIdPageState();
}

class _SearchIdPageState extends State<SearchIdPage> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _pwController;

  late bool isSearchingId;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _pwController = TextEditingController();

    isSearchingId = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: '닉네임',
                  // errorText: _nameErrorText,
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
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: '이메일',
                  // errorText: _nameErrorText,
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
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _pwController,
                decoration: InputDecoration(
                  labelText: '비밀번호',
                  // errorText: _passErrorText,
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
              const SizedBox(
                height: 100,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size(140, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(color: Colors.deepPurple),
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
                  const SizedBox(
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
                      // searchOk();
                    },
                    child: const Text(
                      '확인',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // —Fuction
  searchOk() async {
    setState(() {
      isSearchingId = true;
    });

    var url = Uri.parse(
        'http://192.168.5.83:8080/Flutter/beep_search.jsp?uname=${_nameController.text.trim()}&uemail=${_emailController.text.trim()}&upw=${_pwController.text.trim()}');
    var response = await http.get(url);
    var dataConvertedJSON = jsonDecode(utf8.decode(response.bodyBytes));
    bool isSuccess = dataConvertedJSON['results'];
    // print(isSuccess);
  }
}// END