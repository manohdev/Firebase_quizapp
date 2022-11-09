import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: Container(
        color: Color.fromARGB(255, 192, 66, 66),
        child: Image(image: AssetImage("assets/applogo.png"),),

      )
    );
  }
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Image(image: AssetImage("assets/applogo.png"),)
        )
      )
    );
  }
}