import 'package:flutter/material.dart';
import 'package:flutter_getx_starter/app/bindings/welcome.dart';
import 'package:flutter_getx_starter/app/pages/welcome/welcome.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import '../core/enums/theme_tag.dart';
import '../core/locale/app_translations.dart';
import '../core/themes/dark.dart';
import '../core/themes/light.dart';
import '../core/themes/theme.dart';
import 'bindings/init_app.dart';
import 'router/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  AppTranslations get appTranslations => Get.find<AppTranslations>();

  LightTheme get lightTheme => Get.find<CoreTheme>(tag: ThemeTag.light.name) as LightTheme;

  DarkTheme get darkTheme => Get.find<CoreTheme>(tag: ThemeTag.dark.name) as DarkTheme;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.welcome,
      initialBinding: WelcomeBindings(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations    : appTranslations,
      themeMode       : ThemeMode.light,
      theme           : lightTheme.buildTheme(context),
      darkTheme       : darkTheme.buildTheme(context),
      locale          : const Locale('en'),
      supportedLocales: const [Locale('en')],
      fallbackLocale  : const Locale('en'),
      getPages        : [WelcomePage()],
    );
  }
}
