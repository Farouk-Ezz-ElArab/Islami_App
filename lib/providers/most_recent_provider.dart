import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_preference.dart';

class MostRecentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void readLastSuraList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentStringAsString =
        prefs.getStringList(SharedPreferenceKeys.mostRecentKey) ?? [];
    mostRecentList =
        mostRecentStringAsString.map((element) => int.parse(element)).toList();
    notifyListeners();
  }
}
