import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: const Text('Log In'),
        backgroundColor: Colors.brown[100],
        elevation: 0,
      ),
      body: Column(
         children: [
           CircleAvatar(
             backgroundImage: AssetImage('images/happy.png'),
             radius: 80,
           ),
           CircleAvatar(
             backgroundImage: AssetImage('images/bad.png'),
             radius: 80,
           ),
           CircleAvatar(
             backgroundImage: AssetImage('images/perfect.png'),
             radius: 80,
             
           ),
           CircleAvatar(
             backgroundImage: AssetImage('images/sad.png' ),
             radius: 80,
           ),
          //  CircleAvatar(
          //    backgroundImage: AssetImage('images/sick.png'),
          //    radius: 80,
          //  ),
          //  CircleAvatar(
          //    backgroundImage: AssetImage('images/sohappy.png'),
          //    radius: 80,
          //  ),
          // //  CircleAvatar(
          //    backgroundImage: AssetImage('images/soso.png'),
          //    radius: 80,
          //  ),
         ],
      ),
    );
  }
}