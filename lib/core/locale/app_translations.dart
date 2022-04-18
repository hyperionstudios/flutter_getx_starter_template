import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  final List<String> availableLocales = ["ar", "en"];
  final List<String> fileList = ["general", "validations", "actions"];
  @override
  Map<String, Map<String, String>> get keys => loadedKeys;

  Map<String, Map<String, String>> loadedKeys = {};

  /// check if we have remote languages
  /// load locale local
  Future<AppTranslations> init() async {
    for (String locale in availableLocales) {
      loadedKeys[locale] = {};
      try {
        for (String file in fileList) {
          Map<String, String> translations = {};
          String data = await rootBundle.loadString("assets/locale/$locale/$file.json");
          translations.addAll(Map<String, String>.from(jsonDecode(data)));
          loadedKeys[locale]!.addAll(translations);
        }
      } catch (e) {
        throw Exception('${e.toString()} Failed to load locale $locale');
      }
    }
    return this;
  }
}
