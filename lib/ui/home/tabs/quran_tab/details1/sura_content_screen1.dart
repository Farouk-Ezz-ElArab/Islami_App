import 'package:flutter/material.dart';

import '../../../../../utils/app_styles.dart';

class SuraContentScreen1 extends StatelessWidget {
  String suraContent;
  int index;

  SuraContentScreen1({
    super.key,
    required this.index,
    required this.suraContent,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.025),
      padding: EdgeInsets.symmetric(
        vertical: screenSize.height * 0.02,
        horizontal: screenSize.width * 0.02,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffE2BE7F)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        '$suraContent [${index + 1}]',
        style: AppStyles.bold20Primary,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
