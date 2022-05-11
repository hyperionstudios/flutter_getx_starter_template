import 'model.dart';
import 'roles.dart';

abstract class CoreUser extends CoreModel {
  List<Role> roles = [];
  String? id;
  String? email;
  bool? confirmed;
  CoreUser({required this.roles, this.id, this.email, this.confirmed});

  bool isAdmin() {
    return roles.contains(Role.SuperAdmin);
  }

  bool isCustomer() {
    return roles.contains(Role.Customer);
  }

  bool isShopOwner() {
    return roles.contains(Role.ShopOwner);
  }

  bool isShowRoomOwner() {
    return roles.contains(Role.ShowRoomOwner);
  }

  bool isGuest() {
    return roles.contains(Role.Guest) || roles.isEmpty;
  }
}

class GuestUser extends CoreUser {
  GuestUser({required List<Role> roles}) : super(roles: roles);
}

class AuthUser extends CoreUser {
  AuthUser(
      {required List<Role> roles,
      required String id,
      required String email,
      required bool confirmed})
      : super(roles: roles, id: id, email: email, confirmed: confirmed);
}
