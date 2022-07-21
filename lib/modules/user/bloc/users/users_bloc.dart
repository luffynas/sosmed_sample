import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/modules/user/datasource/local/user_local.dart';
import 'package:sosmed_sample/modules/user/repositories/user_repository2.dart';
import 'package:stream_transform/stream_transform.dart';

part 'users_event.dart';
part 'users_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(const UsersState()) {
    _statusStream = userRepository2.status.listen((event) {
      log('message ::: from stream Subscribtion :: $event');
    });

    on<LoadUsers>(
      _onLoadUsers,
      transformer: throttleDroppable(throttleDuration),
    );
    on<LoadMoreUser>(_onLoadMoreUser);
    on<LoadUserDetail>(_onLoadUserDetail);
    on<RemoveUsers>(_onRemoveUser);
    on<AddUsers>(_onAddUser);
  }

  final UserRepository2 userRepository2 = UserRepository2(UserLocal());
  StreamSubscription? _statusStream;

  Future<void> _onLoadUsers(LoadUsers event, Emitter<UsersState> emit) async {
    if (state.hasReachedMax) return;

    log('message :: state.users.length ::: ${state.users.length}');
    if (event.fresh) {
      emit(state.copy(status: UsersStatus.initial));
    }
    // emit(state.copy());

    await emit.forEach<List<User>>(
      userRepository2.getUsers(
        fresh: event.fresh,
        offset: state.users.length,
      ),
      onData: (users) => state.copy(
        status: users.isEmpty ? UsersStatus.empty : UsersStatus.success,
        users: users,
        hasReachedMax: false,
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
      ),
      onError: (_, __) => state.copy(
        status: UsersStatus.failure,
      ),
    );
  }

  @override
  Future<void> close() async {
    await _statusStream?.cancel();
    return super.close();
  }
}
