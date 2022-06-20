import 'dart:convert';
import 'package:beepbeep_app/login/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class SearchIdPage extends StatefulWidget {
  const SearchIdPage({Key? key}) : super(key: key);

  @override
  State<SearchIdPage> createState() => _SearchIdPageState();
}

class _SearchIdPageState extends State<SearchIdPage> {
  // Property
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _pwController;

  late String name;
  late String email;
  late String pw;
  late String id;

  late List data;

  @override
  void initState() {
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _pwController = TextEditingController();

    name='';
    email='';
    pw='';
    id='';

    data = [];
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
                      print('hihihi');
                      if(_nameController.text.trim().isEmpty){
                        emptyName(context);
                      }else if(_emailController.text.trim().isEmpty){
                        emptyEmail(context);
                      }else if(_pwController.text.trim().isEmpty){
                        emptyPw(context);
                      }else{
                        setState(() {
                          name = _nameController.text.trim();
                          email = _emailController.text.trim();
                          pw = _pwController.text.trim();
                        });
                        print('hihi');
                        getJSONData().then((value) => findIDcheck(context));
                      }
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

emptyName(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('닉네임을 입력하세요.'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.deepPurple,)
  );
}
emptyEmail(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('이메일을 입력하세요.'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.deepPurple,)
  );
}

emptyPw(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('비밀번호를 입력하세요.'),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.deepPurple,)
  );
}

  // —Fuction
  Future<bool> getJSONData() async {

    var url = Uri.parse(
        // 'http://localhost:8080/Flutter/beep_search.jsp?uname=${_nameController.text.trim()}&uemail=${_emailController.text.trim()}&upw=${_pwController.text.trim()}');
        'http://localhost:8080/Flutter/beep_search.jsp?uname=$name&uemail=$email&upw=$pw');
    var response = await http.get(url);

    var dataConvertedJSON = jsonDecode(utf8.decode(response.bodyBytes));
    List result = dataConvertedJSON['results'];

    // print(isSuccess);

    setState(() {
      data = [];
      data.addAll(result);
    });
    if(data.isEmpty){
     return true;
    }else{
      id = data[0]['buid'];
      return true;
    }
  }

    findIDcheck(BuildContext context){
      showDialog(
        context: context, 
        builder: (BuildContext ctx){
          if(id.isEmpty){
            return AlertDialog(
              title: const Text('존재하지 않은 정보입니다.',
              style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: const Text('입력된 정보를 확인해주세요.'),
              actions: [
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: const Text('확인',
                style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            );
          }else {
            return AlertDialog(
              title: const Text('아이디 찾기 성공',
              style: TextStyle(fontWeight: FontWeight.bold),),
              content: Text('가입하신 아이디는 $id 입니다.',),
              actions: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text('닫기')),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> loginPage()));
                },
                child: const Text('로그인 하기',
                style: TextStyle(fontWeight: FontWeight.bold),)),
              ],
            );
          }
        }
        );
    }    
}// END
