import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social/data/local/storage_key.dart';

class Storage {
  static late SharedPreferences _p;
  static SharedPreferences get p => _p;

  static Future<void> init() async {
    log(name: 'SharedPreferences', 'initiated');
    _p = await SharedPreferences.getInstance();
  }

  // ----
  static String get token => p.getString(StorageKey.accessToken) ?? "";
  static set token(String? value) => value != null
      ? p.setString(StorageKey.accessToken, value)
      : p.remove(StorageKey.accessToken);

  // // ----
  // static String? get userJson => p.getString(StorageKey.userInfo);
  // static User? get user => userJson == null || userJson!.isEmpty
  //     ? null
  //     : User.fromJson(jsonDecode(userJson!));
  // static set user(User? u) => u == null
  //     ? p.remove(StorageKey.userInfo)
  //     : p.setString(StorageKey.userInfo, jsonEncode(u));

  // ----
  static String get language => p.getString(StorageKey.language) ?? "";
  static set language(String? value) => value != null
      ? p.setString(StorageKey.language, value)
      : p.remove(StorageKey.language);

  // static Locale? get locale {
  //   if (language.isEmpty) return null;
  //   return L10n.delegate.supportedLocales
  //       .firstWhere((lang) => lang.toLanguageTag() == language);
  // }

  static set locale(Locale? value) => language = value?.toLanguageTag();

  // ----
  static String get themeModeName =>
      p.getString(StorageKey.themeMode) ?? "system";
  static set themeModeName(String value) =>
      p.setString(StorageKey.themeMode, value);

  static ThemeMode get themeMode => ThemeMode.values.byName(themeModeName);
  static set themeMode(ThemeMode? value) =>
      themeModeName = value?.name ?? "system";

  // ----
  static bool get isFirstInstall =>
      p.getBool(StorageKey.isFirstInstall) ?? true;
  static set isFirstInstall(bool value) =>
      p.setBool(StorageKey.isFirstInstall, value);
}
