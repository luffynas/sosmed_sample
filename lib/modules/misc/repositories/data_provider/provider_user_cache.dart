import 'package:sosmed_sample/core/db_constant.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ProviderUserCache {
  late Box _box;

  Future<void> init() async {
    _box = await Hive.openBox(DBConstant.userBox);
  }

  dynamic getValue(String key) {
    init();
    return _box.get(key);
  }

  Future<void> setValue(String key, String value) async {
    await init();
    await _box.put(key, value);
  }

  Future<void> delete(String key) async {
    await init();
    await _box.delete(key);
  }
}
