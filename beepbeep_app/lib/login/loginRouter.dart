import 'package:beepbeep_app/login/loginPage.dart';
import 'package:beepbeep_app/login/register.dart';
import 'package:flutter/material.dart';

class LoginRouter extends StatefulWidget {
  const LoginRouter({Key? key}) : super(key: key);

  @override
  State<LoginRouter> createState() => _LoginRouterState();
}

class _LoginRouterState extends State<LoginRouter> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const LoginPage(),
        '/signup': (context) => const RegisterPage(), // 회원 가입 화면
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
