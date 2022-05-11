enum Role{
  SuperAdmin,
  Customer,
  ShowRoomOwner,
  ShopOwner,
  Guest
}

List<Role> toRoles(List<String> rolesString){
  List<Role> roles = [];
  for( String role in rolesString ){
    roles.add( stringToRole(role) );
  }
  return roles;
}

Role stringToRole(String role){
  return Role.values.firstWhere((element) => element.name == role);
}