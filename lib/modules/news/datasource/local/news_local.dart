import 'dart:async';
import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:rxdart/subjects.dart';
import 'package:sosmed_sample/modules/News/datasource/base_datasource.dart';
import 'package:sosmed_sample/modules/news/datasource/remote/news_remote.dart';
import 'package:sosmed_sample/modules/news/models/news.dart';

class NewsLocal implements BaseDatasource<News> {
  NewsLocal() {
    newsBox = Hive.box<News>('news');
    newsRemote = NewsRemote();
  }

  final _usersStream = BehaviorSubject<List<News>>.seeded([]);
  final _userStream = BehaviorSubject<News>();
  final statusStream = StreamController();

  Box<News>? newsBox;
  NewsRemote? newsRemote;

  @override
  Future<void> add(News data) async {
    // insert into db
    await newsBox?.add(data);
    log('message :: insert into db ::: ${data.toJson()}');

    // insert into Stream
    _usersStream.value.add(data);
    log('message :: insert into Stream ::: ${data.toJson()}');

    // insert via API
    final dd = newsRemote?.add(data);
    dd?.listen((event) {
      log('message ::: update status post in db');
      statusStream.add('posting success');
    }, onError: (error) {
      //remove from DB
      data.delete();

      //remove from Stream
      _usersStream.value.removeWhere((e) => e.id == data.id);

      statusStream.add('posting failed');
    }, onDone: () {
      log('message ::: stream listen :: done');
      statusStream.add('posting done');
    });
  }

  @override
  Stream<List<News>> get({
    bool fresh = false,
    int limit = 20,
    int offset = 0,
  }) async* {
    log('message :: News lenght ${newsBox!.values.length}');
    log('message :: News fresh $fresh');

    if (fresh) {
      try {
        _usersStream.value.clear();
        await newsBox?.clear();

        // yield* _usersStream.asBroadcastStream();

        final users = await newsRemote!.get(limit, offset);
        await newsBox?.addAll(users);

        _usersStream.value.addAll(users);

        yield* _usersStream.asBroadcastStream();
      } catch (e) {
        log('message ::: errorrorororor ::: $e');
      }
    } else {
      if (_usersStream.value.isEmpty) {
        _usersStream.add(newsBox!.values.toList());
      }

      try {
        final users = await newsRemote!.get(limit, offset);

        await newsBox?.addAll(users);

        // _usersStream.value.addAll(users);
        _usersStream.add(users.toList());

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
  Stream<News> getOne(String id) async* {
    try {
      final findUser = newsBox?.values.where((e) => e.id == id);
      // if (findUser?.first.dateOfBirth == null) {
      //   final newData = await newsRemote?.getOne(id);
      //   // final News = newsBox!.values.firstWhere((e) => e.id == id);

      //   _userStream.add(newData!);
      // } else {
      //   _userStream.add(findUser!.first);
      // }
    } catch (e) {
      log('message :::: $e');
    }

    yield* _userStream.asBroadcastStream();
  }

  @override
  Future<void> remove(News data) async {
    if (_usersStream.value.isNotEmpty) {
      _usersStream.value.removeWhere((e) => e.id == data.id);
      await data.delete();
    }
  }

  @override
  Future<void> update(News data) {
    throw UnimplementedError();
  }
}
