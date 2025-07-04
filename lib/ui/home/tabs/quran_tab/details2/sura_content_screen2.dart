import 'package:flutter/material.dart';

import '../../../../../utils/app_styles.dart';

class SuraContentScreen2 extends StatelessWidget {
  String suraContent;

  SuraContentScreen2({super.key, required this.suraContent});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Text(
      suraContent,
      style: AppStyles.bold20Primary,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
