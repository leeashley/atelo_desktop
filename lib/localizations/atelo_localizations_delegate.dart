import 'package:atelo_desktop/localizations/atelo_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AteloLocalizationsDelegate extends LocalizationsDelegate<AteloLocalizations> {
  const AteloLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<AteloLocalizations> load(Locale locale) {
    return SynchronousFuture<AteloLocalizations>(AteloLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AteloLocalizations> old) => false;
}
