import 'package:sosmed_sample/core/db_constant.dart';
import 'package:hive_flutter/hive_flutter.dart';

class DatabaseHelper {
  DatabaseHelper() {
    _init();
  }

  Future<void> _init() async {
    await Hive.initFlutter();
    await Hive.openBox(DBConstant.auth);
    await Hive.openBox(DBConstant.userBox);
  }

  Future<void> removeDB() async {
    await Hive.deleteFromDisk();
  }
}
