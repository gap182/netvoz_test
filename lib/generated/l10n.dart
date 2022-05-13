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

  /// `Netvoz`
  String get appName {
    return Intl.message(
      'Netvoz',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Tu centro Comercial`
  String get yourShoppingCenter {
    return Intl.message(
      'Tu centro Comercial',
      name: 'yourShoppingCenter',
      desc: '',
      args: [],
    );
  }

  /// `Virtual`
  String get virtual {
    return Intl.message(
      'Virtual',
      name: 'virtual',
      desc: '',
      args: [],
    );
  }

  /// `Iniciar sesión`
  String get login {
    return Intl.message(
      'Iniciar sesión',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Continuar con Google`
  String get loginGoogle {
    return Intl.message(
      'Continuar con Google',
      name: 'loginGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Continuar con Facebook`
  String get loginFacebook {
    return Intl.message(
      'Continuar con Facebook',
      name: 'loginFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Continuar con Apple`
  String get loginApple {
    return Intl.message(
      'Continuar con Apple',
      name: 'loginApple',
      desc: '',
      args: [],
    );
  }

  /// `¡Soy nuevo!`
  String get imNew {
    return Intl.message(
      '¡Soy nuevo!',
      name: 'imNew',
      desc: '',
      args: [],
    );
  }

  /// `Regístrate`
  String get register {
    return Intl.message(
      'Regístrate',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Ingresar sin registro`
  String get loginNoregister {
    return Intl.message(
      'Ingresar sin registro',
      name: 'loginNoregister',
      desc: '',
      args: [],
    );
  }

  /// `Al ingresar aceptas nuestros `
  String get acceptTerms {
    return Intl.message(
      'Al ingresar aceptas nuestros ',
      name: 'acceptTerms',
      desc: '',
      args: [],
    );
  }

  /// `Términos y condiciones de Netvoz`
  String get termsNetvoz {
    return Intl.message(
      'Términos y condiciones de Netvoz',
      name: 'termsNetvoz',
      desc: '',
      args: [],
    );
  }

  /// `Aviso de privacidad`
  String get privacy {
    return Intl.message(
      'Aviso de privacidad',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `y`
  String get and {
    return Intl.message(
      'y',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Términos y condiciones`
  String get terms {
    return Intl.message(
      'Términos y condiciones',
      name: 'terms',
      desc: '',
      args: [],
    );
  }

  /// `¡Hola!`
  String get hello {
    return Intl.message(
      '¡Hola!',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Correo electrónico`
  String get email {
    return Intl.message(
      'Correo electrónico',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Contraseña`
  String get password {
    return Intl.message(
      'Contraseña',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `¡Ups!`
  String get ups {
    return Intl.message(
      '¡Ups!',
      name: 'ups',
      desc: '',
      args: [],
    );
  }

  /// `Olvidé la contraseña`
  String get forgotPassword {
    return Intl.message(
      'Olvidé la contraseña',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Continuar`
  String get continueText {
    return Intl.message(
      'Continuar',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Ingresa tus datos y crea una cuenta`
  String get setYourData {
    return Intl.message(
      'Ingresa tus datos y crea una cuenta',
      name: 'setYourData',
      desc: '',
      args: [],
    );
  }

  /// `Nombres`
  String get names {
    return Intl.message(
      'Nombres',
      name: 'names',
      desc: '',
      args: [],
    );
  }

  /// `Apellidos`
  String get lastNames {
    return Intl.message(
      'Apellidos',
      name: 'lastNames',
      desc: '',
      args: [],
    );
  }

  /// `Teléfono celular`
  String get cellPhone {
    return Intl.message(
      'Teléfono celular',
      name: 'cellPhone',
      desc: '',
      args: [],
    );
  }

  /// `Crear cuenta`
  String get createAccount {
    return Intl.message(
      'Crear cuenta',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
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
