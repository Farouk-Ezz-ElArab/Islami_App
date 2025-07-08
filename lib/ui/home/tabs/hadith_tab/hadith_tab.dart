import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/hadith_tab/hadith_item.dart';

class HadithTab extends StatelessWidget {

  HadithTab({super.key,});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery
        .of(context)
        .size;
    return CarouselSlider(
      options: CarouselOptions(
        //animateToClosest: true,
          enlargeCenterPage: true,
          height: screenSize.height * 0.66
      ),
      items: List.generate(50, (index) => index + 1,).map((index) {
        return HadithItem(index: index,);
      }).toList(),
    );
  }
}
