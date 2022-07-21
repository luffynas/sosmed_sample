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
    this.hasReachedMax = false,
  });

  final UsersStatus status;
  final List<User> users;
  final bool hasReachedMax;

  UsersState copy({
    UsersStatus? status,
    List<User>? users,
    bool? hasReachedMax,
  }) =>
      UsersState(
        status: status ?? this.status,
        users: users ?? this.users,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      );

  @override
  String toString() {
    return '''UsersState { status: $status, hasReachedMax: $hasReachedMax, posts: ${users.length} }''';
  }

  @override
  List<Object> get props => [status, users, hasReachedMax];
}
