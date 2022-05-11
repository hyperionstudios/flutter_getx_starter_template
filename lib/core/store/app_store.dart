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
    await _sharedPreferences.clear();
  }

  @override
  remove(StoreKey key) async {
    await _sharedPreferences.remove(key.toString());
  }

  @override
  Future<T?> retrieve<T>(StoreKey key) async {
    if (T == String) {
      return _sharedPreferences.getString(key.toString()) as T?;
    }
    if (T == bool) {
      return _sharedPreferences.getBool(key.toString()) as T?;
    }
    if (T == List<String>) {
      return _sharedPreferences.getStringList(key.toString()) as T?;
    }
    return null;
  }

  @override
  save<T>(StoreKey key, value) async {
    if (T == String) {
      await _sharedPreferences.setString(key.toString(), value as String);
    }
    if (T == bool) {
      await _sharedPreferences.setBool(key.toString(), value as bool);
    }
    if (T == List<String>) {
      await _sharedPreferences.setStringList(key.toString(), value as List<String>);
    }
  }
}
