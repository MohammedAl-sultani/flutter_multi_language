
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:multilanguagetest/MainPage.dart';
import 'package:multilanguagetest/language/Translations.dart';

class AppModel extends ChangeNotifier {

  var locale='ar';
  bool isLoading = true;
  String message;
  bool darkTheme = false;

  String get getLocale => locale == null ? locale = "en" : locale;



  void chngLng(String lng,BuildContext context,)
  {
    locale=lng;
    AppLocalizations.locale= Locale(lng);
    notifyListeners();
  }
  void init() {
  }

  void setLanguage(BuildContext context,String _lng)
  {
    locale=_lng;
    notifyListeners();
  }
}
