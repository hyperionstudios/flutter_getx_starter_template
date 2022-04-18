import 'package:get/get.dart';

import '../enums/theme_tag.dart';
import 'theme.dart';

class ActiveTheme {
  late final CoreTheme theme;
  Future<ActiveTheme> init() async {
    if (Get.isDarkMode) {
      theme = Get.find<CoreTheme>(tag: ThemeTag.dark.name);
    }
    theme = Get.find<CoreTheme>(tag: ThemeTag.light.name);
    return this;
  }
}
