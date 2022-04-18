import 'package:get/get.dart';

import '../controllers/init_app.dart';

class InitAppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitAppController>(() => InitAppController());
  }
}
