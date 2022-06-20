import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegisterIdPage extends StatefulWidget {
  const RegisterIdPage({Key? key}) : super(key: key);

  @override
  State<RegisterIdPage> createState() => _RegisterIdPageState();
}

class _RegisterIdPageState extends State<RegisterIdPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            '아이디 ・ 비밀번호 찾기',
            style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
    
          backgroundColor: Colors.white,
          foregroundColor: Colors.deepPurple,
          elevation: 0,
          bottom: const TabBar(tabs: [
                Tab(text: '아이디찾기',),
                Tab(text: '비밀번호찾기',),
              ],
              ),
        ),
        body: Column(
          children: const [
          ],
        ),
      ),
    );
  }
}