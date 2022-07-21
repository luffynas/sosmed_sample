import 'package:sosmed_sample/modules/news/models/news.dart';

abstract class NewsInterface {
  Stream<List<News>> getPosts({bool fresh, int limit, int offset});

  Stream<News> getPost(String userId);

  Future<void> addPost(News news);

  Future<void> deletePost(News news);

  Future<bool> like(News news);

  Future<bool> dislike(News news);

  Future<bool> bookmark(News news);

  Future<bool> unbookmark(News news);
}
