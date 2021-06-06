// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S current;

  static const AppLocalizationDelegate delegate =
  AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();

      return S.current;
    });
  }

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `hello`
  String get hello {
    return Intl.message(
      'hello',
      name: 'hello',
      desc: 'Hello someone',
      args: [],
    );
  }



  /// `Login`
  String get btnLogin {
    return Intl.message(
      'Login',
      name: 'btnLogin',
      desc: 'Button login label',
      args: [],
    );
  }
  String get labelPhone {
    return Intl.message(
      'Phone',
      name: 'labelPhone',
      desc: '',
      args: [],
    );
  }
  String get phoneEmpty{
    return Intl.message(
      'PhoneEmpty',
      name: 'msgPhoneEmpty',
      desc: '',
      args: [],
    );
  }
  String get phoneNotValid{
    return Intl.message(
      'PhoneNotValid',
      name: 'msgPhoneNotValid',
      desc: '',
      args: [],
    );
  }
  ///`OPT`
  String get labelOPT {
    return Intl.message(
      'OPT',
      name: 'labelOPT',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}