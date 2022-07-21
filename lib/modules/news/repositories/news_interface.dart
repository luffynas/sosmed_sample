import 'package:sosmed_sample/modules/news/models/news.dart';

abstract class NewsInterface {
  Stream<List<News>> getUsers({bool fresh, int limit, int offset});

  Stream<News> getUser(String userId);

  Future<void> addUser(News news);

  Future<void> deleteUser(News news);

  Future<bool> like(News news);

  Future<bool> dislike(News news);

  Future<bool> bookmark(News news);

  Future<bool> unbookmark(News news);
}
