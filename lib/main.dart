import 'package:flutter/material.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/details1/sura_details_screen1.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/details2/sura_details_screen2.dart';
import 'package:islami_app/ui/home_screen.dart';
import 'package:islami_app/ui/intro_screen.dart';
import 'package:islami_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (BuildContext context) {
    return MostRecentProvider();
  },
      child: MyApp()));
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
        SuraDetailsScreen1.name: (context) => SuraDetailsScreen1(),
        SuraDetailsScreen2.name: (context) => SuraDetailsScreen2(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
