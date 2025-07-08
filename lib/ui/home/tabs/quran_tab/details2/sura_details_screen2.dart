import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/details2/sura_content_screen2.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_resources.dart';
import 'package:islami_app/utils/app_styles.dart';

class SuraDetailsScreen2 extends StatefulWidget {
  static const String name = 'sura_details_screen2';

  @override
  State<SuraDetailsScreen2> createState() => _SuraDetailsScreen2State();
}

class _SuraDetailsScreen2State extends State<SuraDetailsScreen2> {
  String suraContent = '';

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)?.settings.arguments as int;
    var screenSize = MediaQuery.of(context).size;
    if (suraContent.isEmpty) {
      loadSuraFile(index);
    }
    return Scaffold(
      backgroundColor: Color(0xff202020),
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranList[index],
          style: AppStyles.bold20Primary,
        ),
      ),
      body:
          suraContent.isEmpty
              ? Center(
                child: CircularProgressIndicator(color: Color(0xffE2BE7F)),
              )
              : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset('assets/images/left.png'),
                        Text(
                          QuranResources.arabicQuranList[index],
                          style: AppStyles.bold24Primary,
                        ),
                        Image.asset('assets/images/right.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: screenSize.height * 0.03),
                  Expanded(
                    child: SingleChildScrollView(
                      child: SuraContentScreen2(suraContent: suraContent),
                    ),
                  ),
                  Image.asset('assets/images/bottom.png'),
                ],
              ),
    );
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/suras/${index + 1}.txt',
    );
    List<String> lines = fileContent.split('\n');
    for (int i = 0; i < lines.length; i++) {
      lines[i] += '[${i + 1}] ';
    }
    suraContent = lines.join();
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
