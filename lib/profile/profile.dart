import 'package:firebase_quizapp/services/auth.dart';
import 'package:flutter/material.dart';

class  ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile'),),
      body: ElevatedButton(
        child: const Text('Sign Out'),
        onPressed: () async {
          await AuthService().signOut();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        },
      ),
      
    );
  }
}