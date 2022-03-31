import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static final ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.red,
      primaryColor: Color(0XFFda291c),
      primaryColorDark: Color(0XFFda291c),
      primaryColorLight: Color(0XFFda291c),
      scaffoldBackgroundColor: Color(0xfff2f1f6),
      fontFamily: 'Apercu',
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Color(0xff282828)),
          actionsIconTheme: IconThemeData(color: Color(0xff282828)),
          titleTextStyle: TextStyle(
              color: Color(0xff282828),
              fontWeight: FontWeight.w700,
              fontFamily: "Roboto",
              fontStyle: FontStyle.normal,
              fontSize: 16)));
}
