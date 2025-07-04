import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/sura_item.dart';
import 'package:islami_app/utils/app_styles.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            cursorColor: Color(0xffE2BE7F),
            style: TextStyle(color: Color(0xffFEFFE8)),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffE2BE7F)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xffE2BE7F)),
              ),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: BorderSide(color: Color(0xffE2BE7F)),
              // ),
              contentPadding: EdgeInsets.symmetric(vertical: 14),
              prefixIcon: Image.asset('assets/images/quran_png.png'),
              hintText: 'Sura Name',
              hintStyle: AppStyles.bold16White,
            ),
          ),
          SizedBox(height: screenSize.height * 0.025),
          Text('Most Recently', style: AppStyles.bold16White),
          SizedBox(height: screenSize.height * 0.015),
          SizedBox(
            height: screenSize.height * 0.16,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(left: screenSize.width * 0.04),
                  decoration: BoxDecoration(
                    color: Color(0xffE2BE7F),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //SizedBox(height: screenSize.height * 0.01),
                          Text('Al-Anbiya', style: AppStyles.bold24Black),
                          Text('الأنبياء', style: AppStyles.bold24Black),
                          SizedBox(height: screenSize.height * 0.02),
                          Text('112 Verses', style: AppStyles.bold14Black),
                        ],
                      ),
                      Image.asset('assets/images/most_recent.png'),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: screenSize.width * 0.02);
              },
              itemCount: 10,
            ),
          ),
          SizedBox(height: screenSize.height * 0.01),
          Text('Suras List', style: AppStyles.bold16White),
          SizedBox(height: screenSize.height * 0.01),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return SuraItem();
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: screenSize.height * 0.02,
                  indent: screenSize.width * 0.12,
                  endIndent: screenSize.width * 0.12,
                );
              },
              itemCount: 114,
            ),
          ),
        ],
      ),
    );
  }
}
