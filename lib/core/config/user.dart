import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../contracts/roles.dart';
import '../contracts/user.dart';
import '../enums/store_key.dart';
import '../store/app_store.dart';

class UserConfig {
  static init() async {
    // get the current tokens , if there is a user stores load it up else make it guest
    AppStore appStore = Get.find<AppStore>();
    String? userId = await appStore.retrieve<String>(StoreKey.userId);
    String? userEmail = await appStore.retrieve<String>(StoreKey.userEmail);
    bool? userConfirmed = await appStore.retrieve<bool>(StoreKey.confirmed);
    List<String>? userRoles = await appStore.retrieve<List<String>>(StoreKey.roles);
    CoreUser user;
    if (userId == null && userEmail == null) {
      user = GuestUser(roles: [Role.Guest]);
    } else {
      user = AuthUser(
          id: userId!,
          email: userEmail!,
          roles: toRoles(userRoles ?? []),
          confirmed: userConfirmed ?? false);
    }
    if (kDebugMode) {
      print('**********************************');
    }
    if (kDebugMode) {
      print(user);
    }
    if (kDebugMode) {
      print('**********************************');
    }
    Get.put<CoreUser>(user, permanent: true);
  }

  static refresh() async {
    AppStore appStore = Get.find<AppStore>();
    String? userId = await appStore.retrieve<String>(StoreKey.userId);
    String? userEmail = await appStore.retrieve<String>(StoreKey.userEmail);
    bool? userConfirmed = await appStore.retrieve<bool>(StoreKey.confirmed);
    List<String>? userRoles = await appStore.retrieve<List<String>>(StoreKey.roles);
    CoreUser user;
    if (userId == null && userEmail == null) {
      user = GuestUser(roles: [Role.Guest]);
    } else {
      user = AuthUser(
          id: userId!,
          email: userEmail!,
          roles: toRoles(userRoles ?? []),
          confirmed: userConfirmed ?? false);
    }
    if (kDebugMode) {
      print('**********************************');
    }
    if (kDebugMode) {
      print(user);
    }
    if (kDebugMode) {
      print('**********************************');
    }
    Get.replace<CoreUser>(user);
  }
}
