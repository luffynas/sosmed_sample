import 'dart:developer';

import 'package:sosmed_sample/modules/news/datasource/local/news_local.dart';
import 'package:sosmed_sample/modules/news/models/news.dart';
import 'package:sosmed_sample/modules/news/repositories/news_interface.dart';

class NewsRepository implements NewsInterface {
  NewsRepository(this.news);

  final NewsLocal news;

  Stream<dynamic> get status => news.statusStream.stream;

  @override
  Future<void> addUser(News data) async {
    log('message ::: addUser ::: ${data.toJson()}');
    try {
      await news.add(data);
    } catch (e) {
      log('message ::: addUser error ::: ${e.toString()}');
    }
  }

  @override
  Future<bool> bookmark(News News) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteUser(News data) async {
    await news.remove(data);
  }

  @override
  Future<bool> dislike(News news) {
    throw UnimplementedError();
  }

  @override
  Stream<News> getUser(String userId) => news.getOne(userId);

  @override
  Stream<List<News>> getUsers({
    bool fresh = false,
    int limit = 20,
    int offset = 0,
  }) =>
      news.get(
        fresh: fresh,
        limit: limit,
        offset: offset,
      );

  @override
  Future<bool> like(News News) {
    throw UnimplementedError();
  }

  @override
  Future<bool> unbookmark(News News) {
    throw UnimplementedError();
  }
}
