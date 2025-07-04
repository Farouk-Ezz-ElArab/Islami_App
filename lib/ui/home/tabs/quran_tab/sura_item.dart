import 'package:flutter/material.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset('assets/images/vector.png'),
            Text('1', style: AppStyles.bold14White),
          ],
        ),
        SizedBox(width: screenSize.width * 0.055),
        Column(
          children: [
            Text('Al-Fatiha', style: AppStyles.bold20White),
            Text('7 Verses', style: AppStyles.bold14White),
          ],
        ),
        Spacer(),
        Text('الفاتحه', style: AppStyles.bold20White),
      ],
    );
  }
}
