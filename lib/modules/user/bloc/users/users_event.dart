part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends UsersEvent {
  const LoadUsers({this.fresh = false});

  final bool fresh;
}

class LoadMoreUser extends UsersEvent {
  const LoadMoreUser();
}

class LoadUserDetail extends UsersEvent {
  const LoadUserDetail({required this.userId});

  final String userId;
}

class RemoveUsers extends UsersEvent {
  const RemoveUsers();
}

class AddUsers extends UsersEvent {
  const AddUsers({required this.user});

  final User user;
}
