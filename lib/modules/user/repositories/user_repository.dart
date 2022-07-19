import 'dart:async';
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:sosmed_sample/core/api/app_api.dart';
import 'package:sosmed_sample/core/db_constant.dart';
import 'package:sosmed_sample/core/exception/app_exception.dart';
import 'package:sosmed_sample/models/base_response.dart';
import 'package:sosmed_sample/modules/user/repositories/api/user_api.dart';

import '../../../models/user.dart';
import 'data_provider/provider_user_api.dart';

class UserRepository {
  UserRepository();

  late UserApi userApi = ProviderUserApi(box: Hive.box(DBConstant.userBox));

  Future<User> authenticate({
    required String email,
    required String password,
  }) async {
    final session = await Auth.doLogin(email, password).whenComplete(() async {
      final _hasToken = await userApi.hasToken();
      if (_hasToken) {
        // await getUserInfo(force: true);
        getUserInfo();
      }
    });

    if (session != null) {
      if (session['status_code'] == 0) {
        // ignore: avoid_dynamic_calls
        // await persistToken(session['data']['token'] as String);
        await setToken(session['data']['token'] as String);
        return User.fromJson(session['data'] as Map<String, dynamic>);
      } else {
        throw AppException(session['message'] as String);
      }
    } else {
      throw AppException('Cannot communicate with server');
    }
  }

  Future<BaseResponse> register({
    required String fullname,
    required String email,
    required String password,
  }) async {
    return Auth.doRegister(fullname, email, password).then((session) async {
      log('sessionsession $session');
      // ignore: unnecessary_null_comparison
      if (session != null) {
        // if (session["code"] == 200) {
        //   // return Session(session['data']["access_token"]);
        //   return "${session['message']}";
        // } else {
        //   throw AppException(session["message"]);
        // }
        return BaseResponse.fromJson(session);
      } else {
        throw AppException("Cannot communicate with server");
      }
    }).catchError(handleError);
  }

  Future<void> deleteToken() async {
    await userApi.deleteToken();
    return;
  }

  Stream<User?> getUserInfo({bool force = false}) async* {
    try {
      final result = await PublicApi.get('/me');
      log('rsult $result');

      final user = User.fromJson(result['data'] as Map<String, dynamic>);
      await userApi.saveUser(user);

      yield* userApi.getUser();
    } catch (e) {
      throw AppException(e.toString());
    }
  }

  // Future<User?> getUserInfo({bool force = false}) async {
  //   return repo.fetchGradually("me", () async {
  //     return await _getUserInfo(force: force);
  //   }, force: force).map((result) {
  //     final data = result.data;
  //     log("user data $data");
  //     if (data != null) {
  //       final user = User.fromMap(data["data"]);
  //       saveUser(user);
  //       return user;
  //     }
  //   }).last;
  // }

  void saveUser(User user) {
    // log("message :: user.type :: ${user.type}");
    // spUtils.putInt("user_id", user.id!);
    // spUtils.putString("name", user.name ?? "");
    // spUtils.putString("email", user.email ?? "");
    // spUtils.putString("username", user.username ?? "");
    // spUtils.putString("avatar", user.avatar ?? "");
    // spUtils.putString("user_type", user.type ?? "");
  }

  Stream<User?> getUserData() async* {
    yield* userApi.getUser();
  }

  Future<String?> getToken() async {
    return userApi.getToken();
  }

  Future<void> setToken(String token) async {
    return userApi.setToken(token);
  }

  Future<bool> hasToken() async {
    return userApi.hasToken();
  }
}
