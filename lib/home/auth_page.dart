import 'package:firebase_quizapp/login/login.dart';
import 'package:firebase_quizapp/login/signup.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // initially show login page

  bool showLoginPage = true;

  @override
  void toogleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });

  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(showSignupScreen: toogleScreen);
    } else {
      return SignupScreen(showLoginScreen: toogleScreen);
    }
  }
}