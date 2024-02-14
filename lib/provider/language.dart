import 'package:smart_care/provider/languageApp/en.dart';
import 'package:smart_care/provider/languageApp/la.dart';
import 'package:smart_care/provider/languageApp/th.dart';

class LanguageApp {
  List languageList = [
    eng,
    th,
    la,
  ];
  Map<String, String> languageApp(String languageApp) {
    if (languageApp == 'EN') {
      return languageList[0];
    }
    if (languageApp == 'TH') {
      return languageList[1];
    }
    if (languageApp == 'LA') {
      return languageList[2];
    } else {
      return languageList[0];
    }
  }
}
