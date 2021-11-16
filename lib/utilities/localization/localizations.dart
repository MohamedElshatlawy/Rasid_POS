import 'dart:async';
import 'dart:ui';

import 'l10n/messages_all.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static Future<AppLocalizations> load(Locale locale) {
    final String name =
    locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  String get locale =>Intl.message('en', name: 'locale');
  String get close =>Intl.message('Close', name: 'close');
  String get closeApp =>Intl.message('Close App!', name: 'closeApp');
  String get title =>Intl.message('Rasid Jack', name: 'title');
  String get stage =>Intl.message('Rasid Jack Test', name: 'stage');
  String get dev =>Intl.message('Rasid Jack Dev', name: 'dev');
  String get arabicLanguage =>Intl.message('عربي', name: 'arabic');
  String get englishLanguage =>Intl.message('English', name: 'english');
  String get noInternetConnection =>Intl.message('No internet connection', name: 'noInternetConnection');
  String get loadingMessage =>Intl.message('Loading...', name: 'loading');
  String get logout =>Intl.message('Logout', name: 'logout');
  String get continueLogout =>Intl.message('Continue logging out', name: 'continueLogout');
  String get alert =>Intl.message('Alert', name: 'alert');
  String get ok =>Intl.message('OK', name: 'ok');
  String get cancel =>Intl.message('CANCEL', name: 'cancel');





}

class SpecificLocalizationDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  final Locale overriddenLocale;

  SpecificLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) => overriddenLocale != null;

  @override
  Future<AppLocalizations> load(Locale locale) =>
      AppLocalizations.load(overriddenLocale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => true;
}
