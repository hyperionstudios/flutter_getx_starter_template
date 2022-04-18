import 'package:flutter/material.dart';

import 'theme.dart';

class DynamicTheme extends CoreTheme {
  late final String name;
  late final ThemeData data;

  DynamicTheme({required this.name, required this.data});

  @override
  String get fileName => name;

  @override
  ThemeData get themeData => data;
}
