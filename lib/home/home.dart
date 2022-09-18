import 'package:flutter/material.dart';
import 'package:firebase_quizapp/login/login.dart';
//import 'package:firebase_quizapp/shared/shared.dart';
import 'package:firebase_quizapp/topics/topics.dart';
import 'package:firebase_quizapp/services/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('loading');
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("error"),
          );
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}

    
    