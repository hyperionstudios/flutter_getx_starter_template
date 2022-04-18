import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/config/app.dart' as config;

/// The main entry point for the application.
/// we await App.init() to make sure the app is fully initialized before we run the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await config.App.init();
  runApp(const App());
}
