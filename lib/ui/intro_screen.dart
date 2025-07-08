import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_app/ui/home_screen.dart';

class IntroScreenDemo extends StatefulWidget {
  static const String name = 'intro_screen';

  const IntroScreenDemo({super.key});

  @override
  State<IntroScreenDemo> createState() => _IntroScreenDemoState();
}

class _IntroScreenDemoState extends State<IntroScreenDemo> {
  // 1. Define a `GlobalKey` as part of the parent widget's state
  final _introKey = GlobalKey<IntroductionScreenState>();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return IntroductionScreen(
      dotsDecorator: DotsDecorator(
        color: Colors.grey,
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xffE2BE7F),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
      skipStyle: ButtonStyle(),
      globalBackgroundColor: Color(0xff202020),
      // 2. Pass that key to the `IntroductionScreen` `key` param
      key: _introKey,
      pages: [
        PageViewModel(
          titleWidget: Image.asset('assets/images/islami_tag.png'),
          decoration: PageDecoration(),
          bodyWidget: Column(
            children: [
              Image.asset(
                'assets/images/first_intro.png',
                height: screenSize.height * 0.35,
              ),
              SizedBox(height: screenSize.height * 0.08),
              Text(
                'Welcome To Islami App',
                style: TextStyle(
                  color: Color(0xffE2BE7F),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset('assets/images/islami_tag.png'),
          decoration: PageDecoration(),
          bodyWidget: Column(
            children: [
              Image.asset(
                'assets/images/second_intro.png',
                height: screenSize.height * 0.35,
              ),
              SizedBox(height: screenSize.height * 0.08),
              Text(
                'Welcome To Islmi App\n',
                style: TextStyle(
                  color: Color(0xffE2BE7F),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'We Are Very Excited To Have You In Our Community',
                style: TextStyle(
                  color: Color(0xffE2BE7F),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset('assets/images/islami_tag.png'),
          decoration: PageDecoration(),
          bodyWidget: Column(
            children: [
              Image.asset(
                'assets/images/third_intro.png',
                height: screenSize.height * 0.35,
              ),
              SizedBox(height: screenSize.height * 0.08),
              Text(
                'Reading the Quran\n',
                style: TextStyle(
                  color: Color(0xffE2BE7F),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'Read, and your Lord is the Most Generous',
                style: TextStyle(
                  color: Color(0xffE2BE7F),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset('assets/images/islami_tag.png'),
          decoration: PageDecoration(),
          bodyWidget: Column(
            children: [
              Image.asset(
                'assets/images/fourth_intro.png',
                height: screenSize.height * 0.35,
              ),
              SizedBox(height: screenSize.height * 0.08),
              Text(
                'Bearish\n',
                style: TextStyle(
                  color: Color(0xffE2BE7F),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'Praise the name of your Lord, the Most High',
                style: TextStyle(
                  color: Color(0xffE2BE7F),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        PageViewModel(
          titleWidget: Image.asset('assets/images/islami_tag.png'),
          decoration: PageDecoration(),
          bodyWidget: Column(
            children: [
              Image.asset(
                'assets/images/fifth_intro.png',
                height: screenSize.height * 0.35,
              ),
              SizedBox(height: screenSize.height * 0.08),
              Text(
                'Holy Quran Radio\n',
                style: TextStyle(
                  color: Color(0xffE2BE7F),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                'You can listen to the Holy Quran Radio through the application for free and easily',
                style: TextStyle(
                  color: Color(0xffE2BE7F),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],

      showBackButton: true,
      back: TextButton(
        onPressed: () {
          _introKey.currentState?.previous();
        },
        child: Text(
          "Back",
          style: TextStyle(
            color: Color(0xffE2BE7F),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),

      showNextButton: true,
      next: TextButton(
        onPressed: () {
          _introKey.currentState?.next();
        },
        child: Text(
          'Next',
          style: TextStyle(
            color: Color(0xffE2BE7F),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      showDoneButton: true,
      done: Text(
        "Done",
        style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xffE2BE7F)),
      ),
      onDone: () {
        Navigator.of(context).pushReplacementNamed(HomeScreen.name);
      },
      showSkipButton: true,
      skip: Text(
        "Skip",
        style: TextStyle(
          color: Color(0xffE2BE7F),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      onSkip: () {
        Navigator.of(context).pushReplacementNamed(HomeScreen.name);
      },
    );
  }
}
