import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/subjects.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/modules/user/datasource/base_datasource.dart';
import 'package:sosmed_sample/modules/user/datasource/remote/user_remote.dart';

class UserLocal implements BaseDatasource<User> {
  UserLocal() {
    userBox = Hive.box<User>('users');
    userRemote = UserRemote();
  }

  final _usersStream = BehaviorSubject<List<User>>.seeded([]);
  final _userStream = BehaviorSubject<User>();

  Box<User>? userBox;
  UserRemote? userRemote;

  @override
  Future<void> add(User data) async {
    // insert into db
    await userBox?.add(data);
    log('message :: insert into db ::: ${data.toJson()}');

    // insert into Stream
    _usersStream.value.add(data);
    log('message :: insert into Stream ::: ${data.toJson()}');

    // insert via API
    final dd = userRemote?.add(data);
    dd?.listen((event) {
      log('message ::: update status post in db');
    }, onError: (error) {
      //remove from DB
      data.delete();

      //remove from Stream
      _usersStream.value.removeWhere((e) => e.id == data.id);
    }, onDone: () {
      log('message ::: stream listen :: done');
      get();
    });
  }

  @override
  Stream<List<User>> get({
    bool fresh = false,
    int limit = 20,
    int offset = 0,
  }) async* {
    log('message :: user lenght ${userBox!.values.length}');
    log('message :: user fresh $fresh');

    if (fresh) {
      try {
        _usersStream.value.clear();
        await userBox?.clear();

        // yield* _usersStream.asBroadcastStream();

        final users = await userRemote!.get(limit, offset);
        await userBox?.addAll(users);

        _usersStream.value.addAll(users);

        yield* _usersStream.asBroadcastStream();
      } catch (e) {
        log('message ::: errorrorororor ::: $e');
      }
    } else {
      if (_usersStream.value.isEmpty) {
        _usersStream.add(userBox!.values.toList());
      }

      try {
        final users = await userRemote!.get(limit, offset);

        await userBox?.addAll(users);

        _usersStream.value.addAll(users);

        // yield* _usersStream.asBroadcastStream();

        log('message ::: errorrorororor ::: ${users.length}');
      } catch (e) {
        log('message ::: errorrorororor ::: $e');
      }
    }

    log('message ::: usersStream lenght 1::: ${_usersStream.value.length}');

    yield* _usersStream.asBroadcastStream();
  }

  @override
  Stream<User> getOne(String id) async* {
    final findUser = userBox?.values.where((e) => e.id == id);
    if (findUser!.isEmpty) {
      final newData = await userRemote?.getOne(id);
      await findUser.first
          .copy(
            dateOfBirth: newData?.dateOfBirth,
            phone: newData?.phone,
            email: newData?.email,
          )
          .save();

      _userStream.add(newData!);
    }

    yield* _userStream.asBroadcastStream();
  }

  @override
  Future<void> remove(User data) async {
    if (_usersStream.value.isNotEmpty) {
      _usersStream.value.removeWhere((e) => e.id == data.id);
      await data.delete();
    }
  }

  @override
  Future<void> update(User data) {
    throw UnimplementedError();
  }
}
