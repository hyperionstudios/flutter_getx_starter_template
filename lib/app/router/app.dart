import '../../core/contracts/menu.dart';

class AppRouter {
  static final AppRouter _singleton = AppRouter._internal();
  AppRouter._internal();
  factory AppRouter() {
    return _singleton;
  }

  List<CoreMenu> get menus => [];
}
