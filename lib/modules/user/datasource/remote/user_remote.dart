import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:sosmed_sample/core/api/app_api.dart';
import 'package:sosmed_sample/core/exception/app_exception.dart';
import 'package:sosmed_sample/models/user.dart';

class UserRemote {
  Stream<User> add(User data) async* {
    // await PublicApi.post('path');
    await Future.delayed(const Duration(seconds: 3));
    throwIf(true, AppException('message error throw'));

    log('message ::: add user to API');

    yield data;
    log('message ::: add user to API 2');
  }

  Future<Iterable<User>> get(int limit, int offset) async {
    try {
      final result = await PublicApi.get('/user');
      log('message ::result[data] :: ${result['data'] as List}');
      final data = (result['data'] as List).map((a) {
        final dd = a as Map<String, dynamic>;
        return User.fromJson(dd);
      }).toList();

      return data;
    } catch (e) {
      log('message ::: error ::: $e');
      throw AppException('message ::: $e');
    }
  }

  Future<User> getOne(String id) async {
    try {
      final result = await PublicApi.get('/user/$id');
      log('message ::result[data] :: $result');
      final data = User.fromJson(result);

      return data;
    } catch (e) {
      log('message ::: error ::: $e');
      throw AppException('message ::: $e');
    }
  }

  Future<void> remove(User data) async {}

  Future<void> update(User data) async {}
}
