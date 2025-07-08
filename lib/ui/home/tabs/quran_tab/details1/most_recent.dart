import 'package:flutter/material.dart';
import 'package:islami_app/providers/most_recent_provider.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/details1/sura_details_screen1.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_resources.dart';
import 'package:islami_app/utils/shared_preference.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_styles.dart';

class MostRecent extends StatefulWidget {
  MostRecent({super.key});

  @override
  State<MostRecent> createState() => _MostRecentState();
}

class _MostRecentState extends State<MostRecent> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      mostRecentProvider.readLastSuraList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Most Recently', style: AppStyles.bold16White),
          SizedBox(height: screenSize.height * 0.015),
          SizedBox(
            height: screenSize.height * 0.16,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    saveNewSuraList(mostRecentProvider.mostRecentList[index]);
                    Navigator.of(context).pushNamed(
                      SuraDetailsScreen1.name,
                      arguments: mostRecentProvider.mostRecentList[index],
                    );
                  },
                  child: Container(
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
                            Text(
                              QuranResources.englishQuranList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            Text(
                              QuranResources.arabicQuranList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyles.bold24Black,
                            ),
                            SizedBox(height: screenSize.height * 0.02),
                            Text(
                              '${QuranResources.versesNumberList[mostRecentProvider.mostRecentList[index]]} Verses',
                              style: AppStyles.bold14Black,
                            ),
                          ],
                        ),
                        Image.asset('assets/images/most_recent.png'),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: screenSize.width * 0.02);
              },
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
