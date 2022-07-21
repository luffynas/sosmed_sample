import 'dart:developer';

import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/modules/user/datasource/local/user_local.dart';
import 'package:sosmed_sample/modules/user/repositories/user_interface.dart';

class UserRepository2 implements UserInterface {
  UserRepository2(this.user);

  final UserLocal user;

  Stream<dynamic> get status => user.statusStream.stream;

  @override
  Future<void> addUser(User data) async {
    log('message ::: addUser ::: ${data.toJson()}');
    try {
      await user.add(data);
    } catch (e) {
      log('message ::: addUser error ::: ${e.toString()}');
    }
  }

  @override
  Future<bool> bookmark(User user) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(User data) async {
    await user.remove(data);
  }

  @override
  Future<bool> dislike(User user) {
    throw UnimplementedError();
  }

  @override
  Stream<User> getUser(String userId) => user.getOne(userId);

  @override
  Stream<List<User>> getUsers({
    bool fresh = false,
    int limit = 20,
    int offset = 0,
  }) =>
      user.get(
        fresh: fresh,
        limit: limit,
        offset: offset,
      );

  @override
  Future<bool> like(User user) {
    throw UnimplementedError();
  }

  @override
  Future<bool> unbookmark(User user) {
    throw UnimplementedError();
  }
}
