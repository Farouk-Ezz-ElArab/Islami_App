import 'package:flutter/material.dart';
import 'package:islami_app/ui/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.name,
      routes: {HomeScreen.name: (context) => HomeScreen()},
    );
  }
}
