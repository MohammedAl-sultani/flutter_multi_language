
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef LocaleChangeCallback = void Function(Locale locale);

class AppLocalizations implements WidgetsLocalizations {
  const AppLocalizations();

  static Locale _locale;
  static bool _shouldReload = false;

  static set locale(Locale newLocale) {
    _shouldReload = true;
    AppLocalizations._locale = newLocale;
  }

  static const GeneratedLocalizationsDelegate delegate =
  GeneratedLocalizationsDelegate();

  static LocaleChangeCallback onLocaleChanged;


  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, WidgetsLocalizations);

  @override
  TextDirection get textDirection => TextDirection.ltr;

    String get wel_com => "Welcome";
    String get arabic => "العربية";
    String get english => "English";
    String get select_language => "Select Language";


}

class _AppLocalization_en_US extends AppLocalizations {
  const _AppLocalization_en_US();


  TextDirection get textDirection => TextDirection.ltr;

}

class _AppLocalization_ar_YE extends AppLocalizations {
  const _AppLocalization_ar_YE();

  TextDirection get textDirection => TextDirection.rtl;

  String get english => "English";
  String get wel_com => "مرحبا";
  String get arabic => "العربية";
  String get select_language => "اختر لغة";

}
class GeneratedLocalizationsDelegate extends LocalizationsDelegate<WidgetsLocalizations> {
  const GeneratedLocalizationsDelegate();
  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('ar','YE'),
      Locale('en', 'US'),
    ];
  }

  LocaleResolutionCallback resolution({Locale fallback}) {
    return (Locale locale, Iterable<Locale> supported) {
      if (isSupported(locale)) {
        return locale;
      }
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    };
  }

  @override
  Future<WidgetsLocalizations> load(Locale locale) {
    AppLocalizations._locale ??= locale;
    AppLocalizations._shouldReload = false;

    final String lang = AppLocalizations._locale != null ? AppLocalizations._locale.toString() : "";
    final String languageCode = AppLocalizations._locale != null ? AppLocalizations._locale.languageCode : "";
    if ('en_US' == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _AppLocalization_en_US());
    }
    else if ('ar_YE' == languageCode) {
      return SynchronousFuture<WidgetsLocalizations>(const _AppLocalization_ar_YE());
    }
    else if ('en' == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _AppLocalization_en_US());
    }
    else if ('ar' == lang) {
      return SynchronousFuture<WidgetsLocalizations>(const _AppLocalization_ar_YE());
    }

    return SynchronousFuture<WidgetsLocalizations>(const AppLocalizations());
  }

  @override
  bool isSupported(Locale locale) {
    for (var i = 0; i < supportedLocales.length && locale != null; i++) {
      final l = supportedLocales[i];
      if (l.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => AppLocalizations._shouldReload;
}