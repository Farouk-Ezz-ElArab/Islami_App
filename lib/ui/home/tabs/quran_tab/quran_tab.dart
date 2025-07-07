import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/details1/most_recent.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/details1/sura_details_screen1.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_resources.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/sura_item.dart';
import 'package:islami_app/utils/app_styles.dart';
import 'package:islami_app/utils/shared_preference.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(screenSize.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (text) {
              search(text);
            },
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
          MostRecent(),
          SizedBox(height: screenSize.height * 0.01),
          Text('Suras List', style: AppStyles.bold16White),
          SizedBox(height: screenSize.height * 0.01),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                  child: SuraItem(index: filterList[index]),
                  onTap: () {
                    saveNewSuraList(filterList[index]);
                    Navigator.of(context).pushNamed(
                        SuraDetailsScreen1.name, arguments: filterList[index]);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: screenSize.height * 0.02,
                  indent: screenSize.width * 0.12,
                  endIndent: screenSize.width * 0.12,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void search(String text) {
    List<int> filterSearchList = [];

    if (text.isEmpty) {
      filterList = List.generate(114, (index) => index);
    } else {
      for (int i = 0; i < 114; i++) {
        bool matchesEnglish = QuranResources.englishQuranList[i]
            .toLowerCase()
            .contains(text.toLowerCase());
        bool matchesArabic = QuranResources.arabicQuranList[i]
            .toLowerCase()
            .contains(text.toLowerCase());
        if (matchesEnglish || matchesArabic) {
          filterSearchList.add(i);
        }
      }
      filterList = filterSearchList;
    }
    setState(() {});
  }
}
