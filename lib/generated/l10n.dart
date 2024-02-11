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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TAGER PARAFFIN`
  String get appName {
    return Intl.message(
      'TAGER PARAFFIN',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get enterEmail {
    return Intl.message(
      'Enter Your Email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `enter your password`
  String get enterPassword {
    return Intl.message(
      'enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `don''t have any account ?`
  String get noAccount {
    return Intl.message(
      'don\'\'t have any account ?',
      name: 'noAccount',
      desc: '',
      args: [],
    );
  }

  /// `Register Now`
  String get registerNow {
    return Intl.message(
      'Register Now',
      name: 'registerNow',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get name {
    return Intl.message(
      'Full Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `enter your name`
  String get enterName {
    return Intl.message(
      'enter your name',
      name: 'enterName',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phone {
    return Intl.message(
      'Phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `ُenter your email`
  String get enterPhone {
    return Intl.message(
      'ُenter your email',
      name: 'enterPhone',
      desc: '',
      args: [],
    );
  }

  /// `alerady have an account !`
  String get haveAccount {
    return Intl.message(
      'alerady have an account !',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Login Now`
  String get loginNow {
    return Intl.message(
      'Login Now',
      name: 'loginNow',
      desc: '',
      args: [],
    );
  }

  /// `Rest Password`
  String get restPassword {
    return Intl.message(
      'Rest Password',
      name: 'restPassword',
      desc: '',
      args: [],
    );
  }

  /// `OR`
  String get or {
    return Intl.message(
      'OR',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Scuess Check Gmail`
  String get restEmailMessage {
    return Intl.message(
      'Scuess Check Gmail',
      name: 'restEmailMessage',
      desc: '',
      args: [],
    );
  }

  /// `your email or password is wrong`
  String get wrongPassword {
    return Intl.message(
      'your email or password is wrong',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `invalid email`
  String get wrongEmail {
    return Intl.message(
      'invalid email',
      name: 'wrongEmail',
      desc: '',
      args: [],
    );
  }

  /// `Weak Password`
  String get weakPassword {
    return Intl.message(
      'Weak Password',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `email already in use`
  String get emailUsed {
    return Intl.message(
      'email already in use',
      name: 'emailUsed',
      desc: '',
      args: [],
    );
  }

  /// `Login Success`
  String get loginSuccessMessage {
    return Intl.message(
      'Login Success',
      name: 'loginSuccessMessage',
      desc: '',
      args: [],
    );
  }

  /// `Scuess Verify your Email`
  String get verifyEmailMessage {
    return Intl.message(
      'Scuess Verify your Email',
      name: 'verifyEmailMessage',
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
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
