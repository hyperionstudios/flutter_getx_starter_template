import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/config/app.dart' as config;
import 'core/config/url_strategy.dart';

/// The main entry point for the application.
/// we await App.init() to make sure the app is fully initialized before we run the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await config.App.init();
  runApp(const App());
}
