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
