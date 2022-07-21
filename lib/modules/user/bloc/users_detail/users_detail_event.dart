part of 'users_detail_bloc.dart';

abstract class UsersDetailEvent extends Equatable {
  const UsersDetailEvent();

  @override
  List<Object> get props => [];
}

class LoadUserDetail extends UsersDetailEvent {
  const LoadUserDetail({required this.userId});

  final String userId;

  @override
  List<Object> get props => [userId];
}

// class RemoveUsers extends UsersDetailEvent {
//   const RemoveUsers();
// }

// class AddUsers extends UsersDetailEvent {
//   const AddUsers({required this.user});

//   final User user;
// }
