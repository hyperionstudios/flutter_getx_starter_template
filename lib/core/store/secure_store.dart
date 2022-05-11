import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../contracts/store.dart';
import '../enums/store_key.dart';

class SecureStore implements CoreStore {
  late FlutterSecureStorage _flutterSecureStorage;
  Future<SecureStore> init() async {
    _flutterSecureStorage = const FlutterSecureStorage();
    return this;
  }

  @override
  clear() async {
    await _flutterSecureStorage.deleteAll();
  }

  @override
  remove(StoreKey key) async {
    await _flutterSecureStorage.delete(key: key.name);
  }

  @override
  Future<T?> retrieve<T>(StoreKey key) async {
    if (T == String) {
      return await _flutterSecureStorage.read(key: key.name) as T?;
    }
    return null;
  }

  @override
  save<T>(StoreKey key, value) async {
    if (T == String) {
      await _flutterSecureStorage.write(key: key.name, value: value);
    }
  }
}
