import '../enums/store_key.dart';

abstract class CoreStore {
  save<T>(StoreKey key, dynamic value);
  Future<T?> retrieve<T>(StoreKey key);
  remove(StoreKey key);
  clear();
}
