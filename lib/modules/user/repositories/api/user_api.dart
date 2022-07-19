import 'package:sosmed_sample/models/user.dart';

abstract class UserApi {
  const UserApi();

  Stream<List<User>> getUsers();

  Stream<User> getUser();

  Future<void> saveUsers(List<User> users);

  Future<void> saveUser(User user);

  Future<void> deleteUser(int id);

  Future<void> setToken(String token);
  Future<void> deleteToken();
  Future<String?> getToken();
  Future<bool> hasToken();
}

class UserApiNotFoundException implements Exception {}
