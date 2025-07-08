import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/utils/app_styles.dart';

import '../../../../model/hadith.dart';

class HadithItem extends StatefulWidget {
  int index;

  HadithItem({super.key, required this.index});

  @override
  State<HadithItem> createState() => _HadithItemState();
}

class _HadithItemState extends State<HadithItem> {
  Hadith? hadith;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return hadith == null
        ? Center(child: CircularProgressIndicator(color: Color(0xffE2BE7F)))
        : Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/hadith_bgg.png'),
            ),
            borderRadius: BorderRadius.circular(16),
            color: Color(0xffE2BE7F),
          ),
          child: Padding(
            padding: EdgeInsets.all(screenSize.width * 0.02),
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/images/left.png',
                      color: Colors.black,
                      width: screenSize.width * 0.22,
                    ),
                    Expanded(
                      child: Text(
                        hadith?.title ?? "",
                        style: AppStyles.bold24Black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(
                      'assets/images/right.png',
                      color: Colors.black,
                      width: screenSize.width * 0.22,
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadith?.content ?? "",
                      style: AppStyles.bold16Black,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Image.asset('assets/images/back_hadith.png'),
              ],
            ),
          ),
        );
  }

  void loadHadithFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/hadith/h$index.txt',
    );
    String title = fileContent.substring(0, fileContent.indexOf('\n'));
    String content = fileContent.substring(fileContent.indexOf('\n') + 1);
    hadith = Hadith(title: title, content: content);
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}
