import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/modules/user/datasource/local/user_local.dart';
import 'package:sosmed_sample/modules/user/repositories/user_repository2.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UserRepository2 userRepository2 = UserRepository2(UserLocal());

  UsersBloc() : super(const UsersState()) {
    on<LoadUsers>(_onLoadUsers);
    on<LoadMoreUser>(_onLoadMoreUser);
    on<LoadUserDetail>(_onLoadUserDetail);
    on<RemoveUsers>(_onRemoveUser);
    on<AddUsers>(_onAddUser);
  }

  Future<void> _onLoadUsers(LoadUsers event, Emitter<UsersState> emit) async {
    // emit(state.copy(status: UsersStatus.initial));

    log('message :: state.users.length ::: ${state.users.length}');
    if (event.fresh) {
      emit(state.copy(status: UsersStatus.initial));
    }
    emit(state.copy());

    await emit.forEach<List<User>>(
      userRepository2.getUsers(
        fresh: event.fresh,
        limit: 20,
        offset: state.users.length,
      ),
      onData: (users) => state.copy(
        status: users.isEmpty ? UsersStatus.empty : UsersStatus.success,
        users: users,
      ),
      onError: (_, __) => state.copy(
        status: UsersStatus.failure,
      ),
    );
  }

  Future<void> _onRemoveUser(
    RemoveUsers event,
    Emitter<UsersState> emit,
  ) async {
    // emit(state.copy(status: UsersStatus.initial));

    emit(state.copy(status: UsersStatus.loading));

    await userRepository2.deleteUser(User.empty());

    // emit(state.copy(status: UsersStatus.success));
    add(const LoadUsers());
  }

  Future<void> _onAddUser(AddUsers event, Emitter<UsersState> emit) async {
    // emit(state.copy(status: UsersStatus.initial));

    // emit(state.copy(status: UsersStatus.loading));

    await userRepository2.addUser(
      User.empty().copy(
        id: '23u490238409',
        title: 'hello',
        email: 'good@gmail.com',
      ),
    );

    add(const LoadUsers());
  }

  Future<void> _onLoadMoreUser(
    LoadMoreUser event,
    Emitter<UsersState> emit,
  ) async {
    emit(state.copy(status: UsersStatus.loading));
    log('message :: state.users.length ::: ${state.users.length}');
    await emit.forEach<List<User>>(
      userRepository2.getUsers(
        limit: 20,
        offset: state.users.length,
      ),
      onData: (users) => state.copy(
        status: users.isEmpty ? UsersStatus.empty : UsersStatus.success,
        users: users,
      ),
      onError: (_, __) => state.copy(
        status: UsersStatus.failure,
      ),
    );
  }

  Future<void> _onLoadUserDetail(
    LoadUserDetail event,
    Emitter<UsersState> emit,
  ) async {
    emit(state.copy(status: UsersStatus.loading));
    log('message :: state.users.length ::: ${state.users.length}');
    await emit.forEach<User>(
      userRepository2.getUser(event.userId),
      onData: (user) => state.copy(
        status: UsersStatus.success,
        user: user,
      ),
      onError: (_, __) => state.copy(
        status: UsersStatus.failure,
      ),
    );
  }
}
