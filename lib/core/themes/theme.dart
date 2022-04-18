import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// primaryColor, secondaryColor , infoColor ,
/// successColor , warningColor , dangerColor ,
/// lightBgColor , darkBgColor ,
abstract class CoreTheme {
  Map<String, dynamic> themeSettings = {};

  /// light.json , dark.json , {*}.json
  String get fileName;

  ThemeData get themeData;

  set baseThemeData(ThemeData baseThemeData) {
    this.baseThemeData = baseThemeData;
  }

  Future<CoreTheme> init() async {
    try {
      String data = await rootBundle.loadString('assets/themes/$fileName.json');
      themeSettings = Map<String, dynamic>.from(jsonDecode(data));
    } catch (e) {
      throw Exception('${e.toString()} Failed to load Theme Settings');
    }
    return this;
  }

  Color color(String name, String shade) {
    String value = themeSettings["colors"][name][shade] ?? '#ff8d00';
    if (value.startsWith('#')) {
      value = value.replaceAll('#', '');
    }
    return Color(int.tryParse('0xff$value') ?? 0xffff8d00);
  }

  Color get primaryColor => color('primary', 'main');

  Color get primaryLightColor => color('primary', 'light');

  Color get primaryDarkColor => color('primary', 'dark');

  Color get secondaryColor => color('secondary', 'main');

  Color get secondaryLightColor => color('secondary', 'light');

  Color get secondaryDarkColor => color('secondary', 'dark');

  Color get infoColor => color('info', 'main');

  Color get infoLightColor => color('info', 'light');

  Color get infoDarkColor => color('info', 'dark');

  Color get successColor => color('success', 'main');

  Color get successLightColor => color('success', 'light');

  Color get successDarkColor => color('success', 'dark');

  Color get warningColor => color('warning', 'main');

  Color get warningLightColor => color('warning', 'light');

  Color get warningDarkColor => color('warning', 'dark');

  Color get dangerColor => color('danger', 'main');

  Color get dangerLightColor => color('danger', 'light');

  Color get dangerDarkColor => color('danger', 'dark');

  ThemeData buildTheme(BuildContext context) {
    return themeData.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(primaryColor),
        ),
      ),
    );
  }
}
