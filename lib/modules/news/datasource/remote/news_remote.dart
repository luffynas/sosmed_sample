import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:sosmed_sample/core/api/app_api.dart';
import 'package:sosmed_sample/core/exception/app_exception.dart';
import 'package:sosmed_sample/modules/news/models/news.dart';

class NewsRemote {
  Stream<News> add(News data) async* {
    // await PublicApi.post('path');
    await Future.delayed(const Duration(seconds: 3));
    throwIf(true, AppException('message error throw'));

    log('message ::: add News to API');

    yield data;
    log('message ::: add News to API 2');
  }

  Future<Iterable<News>> get(int limit, int offset) async {
    try {
      final result = await PublicApi.get('/News');
      log('message ::result[data] :: ${result['data'] as List}');
      final data = (result['data'] as List).map((a) {
        final dd = a as Map<String, dynamic>;
        return News.fromJson(dd);
      }).toList();

      return data;
    } catch (e) {
      log('message ::: error ::: $e');
      throw AppException('message ::: $e');
    }
  }

  Future<News> getOne(String id) async {
    try {
      final result = await PublicApi.get('/News/$id');
      log('message ::result[data] :: $result');
      final data = News.fromJson(result);

      return data;
    } catch (e) {
      log('message ::: error ::: $e');
      throw AppException('message ::: $e');
    }
  }

  Future<void> remove(News data) async {}

  Future<void> update(News data) async {}
}
