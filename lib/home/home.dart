import 'package:firebase_quizapp/home/auth_page.dart';
import 'package:firebase_quizapp/login/signup.dart';
import 'package:firebase_quizapp/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_quizapp/login/login.dart';
import 'package:firebase_quizapp/profile/profile.dart';
import 'package:firebase_quizapp/topics/topics.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService().userStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState== ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Text('error');
        } else if (snapshot.hasData) {
          return const TopicsScreen();
        } else {
          return const AuthPage();
        }
      }
    );
  }
}