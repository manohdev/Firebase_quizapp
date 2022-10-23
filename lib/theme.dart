import 'package:flutter/material.dart';

var appTheme = ThemeData(

  fontFamily: 'Nunito',
  brightness: Brightness.dark,
  buttonTheme: const ButtonThemeData(),
  bottomAppBarTheme: const BottomAppBarTheme(color:Colors.black87),

  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize:18),
    bodyText2: TextStyle(fontSize:20),
    button: TextStyle(
      letterSpacing: 1.5,
      fontWeight: FontWeight.bold
    ),
    headline1: TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold
    ),
    subtitle1: TextStyle(
      color: Colors.white,
    )
  ),

);