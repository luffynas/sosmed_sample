part of 'users_detail_bloc.dart';

enum UsersDetailStatus {
  initial,
  loading,
  success,
  failure,
  empty,
}

class UsersDetailState extends Equatable {
  const UsersDetailState({
    this.status = UsersDetailStatus.initial,
    this.user,
  });

  final UsersDetailStatus status;
  final User? user;

  UsersDetailState copy({
    UsersDetailStatus? status,
    User? user,
  }) =>
      UsersDetailState(
        status: status ?? this.status,
        user: user ?? this.user,
      );

  @override
  String toString() {
    return '''UsersDetailState { status: $status, user: $user }''';
  }

  @override
  List<Object> get props => [status];
}
