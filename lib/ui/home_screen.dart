import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio_tab/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/tasbih_tab/tasbih_tab.dart';
import 'package:islami_app/ui/home/tabs/time_tab/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String name = "home_screen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    TasbihTab(),
    RadioTab(),
    TimeTab()
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/${getBackGround()}_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xffE2BE7F),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
              //print('selected index is: $selectedIndex');
            },
            //fixedColor: Colors.white,
            showUnselectedLabels: false,
            // type: BottomNavigationBarType.fixed,
            // backgroundColor: Color(0xffE2BE7F),
            items: [
              BottomNavigationBarItem(
                icon: buildBottomNavigationBar(index: 0, icon: 'quran'),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                icon: buildBottomNavigationBar(index: 1, icon: 'hadith'),
                label: 'Hadith',
              ),
              BottomNavigationBarItem(
                icon: buildBottomNavigationBar(index: 2, icon: 'tasbih'),
                label: 'Tasbih',
              ),
              BottomNavigationBarItem(
                icon: buildBottomNavigationBar(index: 3, icon: 'radio'),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon: buildBottomNavigationBar(index: 4, icon: 'time'),
                label: 'Time',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Image.asset('assets/images/islami_logo.png'),
              Expanded(child: tabs[selectedIndex]),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBottomNavigationBar({required int index, required String icon}) {
    return index == selectedIndex ?
    Container(
        padding: EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 20
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: Color(0xff202020).withValues(alpha: 0.6)
        ),
        child: ImageIcon(AssetImage('assets/images/${icon}_icon.png'))
    )
        : ImageIcon(AssetImage('assets/images/${icon}_icon.png'));
  }

  String getBackGround() {
    switch (selectedIndex) {
      case 0:
        return 'quran';
      case 1:
        return 'hadith';
      case 2:
        return 'tasbih';
      case 3:
        return 'radio';
      case 4:
        return 'time';
      default:
        return 'quran';
    }
  }
}
