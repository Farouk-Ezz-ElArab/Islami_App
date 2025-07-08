import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islami_app/utils/app_styles.dart';

class TasbihTab extends StatefulWidget {
  const TasbihTab({super.key});

  @override
  State<TasbihTab> createState() => _TasbihTabState();
}

class _TasbihTabState extends State<TasbihTab> {
  double rotateTurns = 0;
  int clicks = 0;
  int i = 0;
  List<String> titles = [' سَبِّحِ اسْمَ رَبِّكَ الأعلى', 'الحمد ', ' التكبير'];
  List<String> statue = ['سبحان الله', 'الحمد لله', 'الله اكبر'];

  void rotate() {
    if (clicks == 33) {
      clicks = 0;
    }
    if (clicks == 0) {
      i++;
    }
    if (i > 2) {
      i = 0;
    }
    rotateTurns += 1 / 33;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: screenSize.height * 0.02,),
        Text(titles[i], style: AppStyles.bold36White,
          textAlign: TextAlign.center,),
        GestureDetector(
          onTap: () {
            clicks++;
            rotate();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedRotation(turns: rotateTurns,
                  duration: 100.ms,
                  child: Image.asset('assets/images/sibha.png',)),
              Column(
                children: [
                  SizedBox(height: screenSize.height * 0.08,),
                  Text(statue[i], style: AppStyles.bold36White,),
                  SizedBox(height: screenSize.height * 0.02,),
                  Text('$clicks', style: AppStyles.bold36White,),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
