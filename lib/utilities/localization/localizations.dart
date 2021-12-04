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

  String get locale => Intl.message('en', name: 'locale');
  String get close => Intl.message('Close', name: 'close');
  String get closeApp => Intl.message('Close App!', name: 'closeApp');
  String get title => Intl.message('Rasid Jack', name: 'title');
  String get stage => Intl.message('Rasid Jack Test', name: 'stage');
  String get dev => Intl.message('Rasid Jack Dev', name: 'dev');
  String get arabicLanguage => Intl.message('عربي', name: 'arabic');
  String get englishLanguage => Intl.message('English', name: 'english');
  String get noInternetConnection =>
      Intl.message('No internet connection', name: 'noInternetConnection');
  String get loadingMessage => Intl.message('Loading...', name: 'loading');
  String get logout => Intl.message('Logout', name: 'logout');
  String get continueLogout =>
      Intl.message('Continue logging out', name: 'continueLogout');
  String get alert => Intl.message('Alert', name: 'alert');
  String get ok => Intl.message('OK', name: 'ok');
  String get cancel => Intl.message('CANCEL', name: 'cancel');
  String get phoneNum =>
      Intl.message('Registry number/hobby', name: 'phoneNum');
  String get password => Intl.message('Password', name: 'password');
  String get forgetPassword =>
      Intl.message('Forget Password', name: 'forgetPassword');
  String get login => Intl.message('Login', name: 'login');
  String get aboutPhone => Intl.message('About Phone', name: 'aboutApp');
  String get notHaveAccount =>
      Intl.message('Dont Have Account', name: 'notHaveAccount');
  String get register => Intl.message('Registeration', name: 'register');
  String get enterNum => Intl.message('Enter Num', name: 'enterNum');
  String get coinRial => Intl.message('Rial', name: 'coinRial');
  String get deviceId => Intl.message('Device ID', name: 'deviceId');
  String get pay => Intl.message('Pay', name: 'pay');
  String get delete => Intl.message('Delete', name: 'delete');
  String get back => Intl.message('Back', name: 'back');
  String get receipt => Intl.message('Receipt', name: 'receipt');
  String get search => Intl.message('Search', name: 'search');
  String get operationNum =>
      Intl.message('Operation Number', name: 'operationNum');
  String get operationval =>
      Intl.message('Operation Value', name: 'operationval');
  String get operationStatus =>
      Intl.message('Operation Status', name: 'operationStatus');
  String get paymentMethod =>
      Intl.message('Payment Method', name: 'paymentMethod');
  String get lastfourNumOfCard =>
      Intl.message('The last four digits of the card',
          name: 'lastfourNumOfCard');
  String get approvalNumber =>
      Intl.message('Approval Number', name: 'approvalNumber');
  String get processes => Intl.message('Processes', name: 'processes');
  String get recovery => Intl.message('Recovery', name: 'recovery');
  String get userName => Intl.message('UserName', name: 'userName');
  String get shopping => Intl.message('Shopping', name: 'shopping');
  String get buyWithCash => Intl.message('Buy With Cash', name: 'buyWithCash');
  String get commissions => Intl.message('Commissions', name: 'commissions');
  String get connectivity => Intl.message('Connectivity', name: 'connectivity');
  String get contactUs => Intl.message('Contact Us', name: 'contactUs');
  String get liveSupport => Intl.message('Live Support', name: 'liveSupport');
  String get accountManager =>
      Intl.message('Account Manager', name: 'accountManager');
  String get cashAmount => Intl.message('Cash Amount', name: 'cashAmount');
  String get withdrawingCommissions =>
      Intl.message('Withdrawing Commissions', name: 'withdrawingCommissions');
  String get name => Intl.message('Name', name: 'name');
  String get numberofstatement =>
      Intl.message('Number Of Statement', name: 'numberofstatement');
  String get commissionDilalog =>
      Intl.message('Commission Dilalog', name: 'commissionDilalog');
  String get sendOrder => Intl.message('Send Pull Order', name: 'sendOrder');
  String get youHaveToAcceptTermsAndConditions =>
      Intl.message("للإستمرار يجب الموافقة علي الشروط والأحكام.",
          name: "youHaveToAcceptTermsAndConditions");
  String get pleaseEnter => Intl.message('فضلا ادخل', name: 'pleaseEnter');
  String get allOfficialCorrespondenceViaThisEmail =>
      Intl.message("جميع المراسلات الرسميه تتم عبر هذا البريد الالكتروني*",
          name: "allOfficialCorrespondenceViaThisEmail");
  String get correctly => Intl.message('بشكل صحيح', name: 'correctly');
  String get identity => Intl.message('الهوية', name: 'identity');
  String get registrationNumber =>
      Intl.message('رقم السجل', name: 'registrationNumber');
  String get phoneNumber => Intl.message('رقم الجوال', name: 'phoneNumber');
  String get requestNewCodeMessage =>
      Intl.message("اطلب رمزًا جديدًا في", name: "requestNewCodeMessage");
  String get requestNewCode =>
      Intl.message("اطلب رمزًا جديدًا", name: "requestNewCode");
  String get email => Intl.message('البريد الالكتروني', name: 'email');
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
