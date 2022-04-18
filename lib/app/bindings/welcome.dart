import 'package:flutter_getx_starter/app/controllers/welcome.dart';
import 'package:get/get.dart';

class WelcomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WelcomeController());
  }
}
