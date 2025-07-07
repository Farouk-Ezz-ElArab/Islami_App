import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceKeys {
  static const String mostRecentKey = 'most_recent';
}

void saveNewSuraList(int newSuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentIndicesList =
      prefs.getStringList(SharedPreferenceKeys.mostRecentKey) ?? [];

  if (mostRecentIndicesList.contains('$newSuraIndex')) {
    mostRecentIndicesList.remove('$newSuraIndex');
    mostRecentIndicesList.insert(0, '$newSuraIndex');
  } else {
    mostRecentIndicesList.insert(0, '$newSuraIndex');
  }
  if (mostRecentIndicesList.length > 5) {
    // mostRecentIndicesList.removeLast();

    mostRecentIndicesList = mostRecentIndicesList.sublist(0, 4);
  }
  await prefs.setStringList(
    SharedPreferenceKeys.mostRecentKey,
    mostRecentIndicesList,
  );
}
