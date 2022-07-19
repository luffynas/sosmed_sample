import '../../../models/user.dart';

abstract class UserInterface {
  Stream<List<User>> getUsers({bool fresh, int limit, int offset});

  Stream<User> getUser(String userId);

  Future<void> addUser(User user);

  Future<void> deleteUser(User user);

  Future<bool> like(User user);

  Future<bool> dislike(User user);

  Future<bool> bookmark(User user);

  Future<bool> unbookmark(User user);
}
