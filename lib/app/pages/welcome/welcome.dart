import 'package:flutter_getx_starter/app/router/routes.dart';
import 'package:flutter_getx_starter/app/screens/welcome/welcome.dart';
import 'package:get/get.dart';

import '../../bindings/welcome.dart';

class WelcomePage extends GetPage {
  WelcomePage()
      : super(
          name   : AppRoutes.welcome,
          page   : () => WelcomeScreen(),
          binding: WelcomeBindings(),
        );
}
