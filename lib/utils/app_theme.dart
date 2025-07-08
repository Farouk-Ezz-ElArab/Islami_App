import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
    ),
    textTheme: TextTheme(),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff202020),
          //foregroundColor: Color(0xffE2BE7F),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Color(0xffE2BE7F),
          )

      )
  );
}
