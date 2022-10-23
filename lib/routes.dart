import 'package:firebase_quizapp/about/about.dart';
import 'package:firebase_quizapp/home/home.dart';
import 'package:firebase_quizapp/login/login.dart';
import 'package:firebase_quizapp/login/signup.dart';
import 'package:firebase_quizapp/profile/profile.dart';
import 'package:firebase_quizapp/topics/topics.dart';

var appRoutes = {
  '/': (context) => const HomeScreen(),
  '/topics': (context) => const TopicsScreen(),
  '/profile': (context) => const ProfileScreen(),
   '/about': (context) => const AboutScreen()
};