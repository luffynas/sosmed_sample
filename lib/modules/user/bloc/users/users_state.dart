part of 'users_bloc.dart';

enum UsersStatus {
  initial,
  loading,
  success,
  failure,
  empty,
}

class UsersState extends Equatable {
  const UsersState({
    this.status = UsersStatus.initial,
    this.users = const <User>[],
    this.user,
  });

  final UsersStatus status;
  final List<User> users;
  final User? user;

  UsersState copy({UsersStatus? status, List<User>? users, User? user}) =>
      UsersState(
        status: status ?? this.status,
        users: users ?? this.users,
        user: user ?? this.user,
      );

  @override
  List<Object> get props => [status];
}
