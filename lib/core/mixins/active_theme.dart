import 'package:get/get.dart';

import '../enums/theme_tag.dart';
import '../themes/active.dart';

mixin ActiveThemeMixin {
  ActiveTheme get activeTheme => Get.find<ActiveTheme>(tag: ThemeTag.active.name);
}
