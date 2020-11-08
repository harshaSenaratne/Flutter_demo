import 'package:flutter/material.dart';

class GlobalTheme {
  //Theme Configuration for the Dark Theme
  ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: Color(0xff182e42),
      canvasColor: Color(0xff182e42),
      scaffoldBackgroundColor: Color(0xff121a23),
      textTheme: TextTheme(
        headline5: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.normal,
            color: Colors.white),
        headline6: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
            color: Colors.white),
      ),
           appBarTheme: AppBarTheme(
          color: Color(0xff182e42),
          actionsIconTheme: IconThemeData(color: Colors.white))
          
          );
          

  //Theme Configuration for the Light Theme
  ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: Color(0xfff5f5f5),
      canvasColor: Color(0xfff5f5f5),
      scaffoldBackgroundColor: Color(0xffe7ecf4),
      textTheme: TextTheme(
        headline5: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.normal,
            color: Colors.black),
        headline6: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.25,
            color: Colors.black), 
      ),
      appBarTheme: AppBarTheme(
          color: Color(0xfff5f5f5),
          actionsIconTheme: IconThemeData(color: Colors.black))
          );
        
}
