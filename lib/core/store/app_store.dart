import 'package:shared_preferences/shared_preferences.dart';

import '../contracts/store.dart';
import '../enums/store_key.dart';

class AppStore implements CoreStore {
  late SharedPreferences _sharedPreferences;

  Future<AppStore> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  @override
  clear() async {
    // TODO: implement clear
    throw UnimplementedError();
  }

  @override
  remove(StoreKey key) async {
    // TODO: implement remove
    throw UnimplementedError();
  }

  @override
  Future<T?> retrieve<T>(StoreKey key) async {
    // TODO: implement retrieve
    throw UnimplementedError();
  }

  @override
  save<T>(StoreKey key, value) async {
    // TODO: implement save
    throw UnimplementedError();
  }
}
