import 'package:flutter/material.dart';

class AppLocale extends ChangeNotifier {
  Locale? _locale;

  Locale get locale => _locale ?? Locale('en');

  void changeLocale(Locale newLocale) {
    if(newLocale == Locale('es')) {
      _locale = Locale('es');
    } else if(newLocale == Locale('ar')){
      _locale = Locale('ar');
    }
    else {
      _locale = Locale('en');
    }
    notifyListeners();
  }
}