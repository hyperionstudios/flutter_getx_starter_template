import 'package:get/get.dart';

import '../enums/theme_tag.dart';
import '../locale/app_translations.dart';
import '../store/app_store.dart';
import '../store/secure_store.dart';
import '../themes/active.dart';
import '../themes/dark.dart';
import '../themes/light.dart';
import '../themes/theme.dart';
import 'api_router.dart';
import 'user.dart';

class App {
  static init() async {
    await Get.putAsync<AppStore>(() => AppStore().init(), permanent: true);
    await Get.putAsync<SecureStore>(() => SecureStore().init(), permanent: true);
    await Get.putAsync<AppTranslations>(() => AppTranslations().init(), permanent: true);
    await Get.putAsync<ApiRouter>(() => ApiRouter().init(), permanent: true);
    await Get.putAsync<CoreTheme>(() => LightTheme().init(), tag: ThemeTag.light.name);
    await Get.putAsync<CoreTheme>(() => DarkTheme().init(), tag: ThemeTag.dark.name);
    await Get.putAsync<ActiveTheme>(() => ActiveTheme().init(),
        permanent: true, tag: ThemeTag.active.name);
    await UserConfig.init();
  }
}
