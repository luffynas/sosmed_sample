import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/subjects.dart';
import 'package:sosmed_sample/core/constant.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/modules/user/repositories/api/user_api.dart';

class ProviderUserApi extends UserApi {
  ProviderUserApi({
    required Box box,
  }) : _box = box;

  late Box _box;

  final _usersStream = BehaviorSubject<List<User>>.seeded([]);
  final _userStream = BehaviorSubject<User>();

  dynamic getValue(String key) {
    return _box.get(key);
  }

  Future<void> setValue(String key, String value) async {
    await _box.put(key, value);
  }

  @override
  Future<void> deleteUser(int id) async {
    final key = '${BoxConstant.user}_$id';
    await _box.delete(key);
    return;
  }

  @override
  Stream<User> getUser() => _userStream.asBroadcastStream();

  @override
  Stream<List<User>> getUsers() => _usersStream.asBroadcastStream();

  @override
  Future<void> setToken(String token) {
    return setValue(BoxConstant.tokenApp, token);
  }

  @override
  Future<String?> getToken() async {
    return getValue(BoxConstant.tokenApp) as String?;
  }

  @override
  Future<bool> hasToken() async {
    final hasToken =
        await getToken() != null && getToken().toString().isNotEmpty;
    return hasToken;
  }

  @override
  Future<void> deleteToken() async {
    await _box.delete(BoxConstant.tokenApp);
    return;
  }

  @override
  Future<void> saveUser(User user) {
    _userStream.add(user);
    final key = '${BoxConstant.user}_${user.id}';
    return setValue(key, json.encode(user));
  }

  @override
  Future<void> saveUsers(List<User> users) {
    _usersStream.add(users);
    return setValue(BoxConstant.users, json.encode(users));
  }
}
