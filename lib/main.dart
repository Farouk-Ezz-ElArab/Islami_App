import 'package:flutter/material.dart';
import 'package:islami_app/ui/home_screen.dart';
import 'package:islami_app/ui/intro_screen.dart';
import 'package:islami_app/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreenDemo.name,
      routes: {
        IntroScreenDemo.name: (context) => IntroScreenDemo(),
        HomeScreen.name: (context) => HomeScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
