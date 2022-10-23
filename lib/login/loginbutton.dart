import 'package:flutter/material.dart';
// have login button and sign up button default structure

class LoginButton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String text;
  final Function loginmethod;
  
  const LoginButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.text,
    required this.loginmethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white, size: 20),
        label: Text(text),
        onPressed: () => loginmethod(),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10),
          backgroundColor: color,
        ),
      )
    );
  }
}
