import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_resources.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraItem extends StatelessWidget {

  int index;

  SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/vector.png'),
            Text('${index + 1}', style: AppStyles.bold14White),
          ],
        ),
        SizedBox(width: screenSize.width * 0.055),
        Column(
          children: [
            Text(QuranResources.englishQuranList[index],
                style: AppStyles.bold20White),
            Text('${QuranResources.versesNumberList[index]} Verses',
                style: AppStyles.bold14White),
          ],
        ),
        Spacer(),
        Text(QuranResources.arabicQuranList[index],
            style: AppStyles.bold20White),
      ],
    );
  }
}
