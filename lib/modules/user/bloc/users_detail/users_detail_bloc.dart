import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/modules/user/datasource/local/user_local.dart';
import 'package:sosmed_sample/modules/user/repositories/user_repository2.dart';
import 'package:stream_transform/stream_transform.dart';

part 'users_detail_event.dart';
part 'users_detail_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class UsersDetailBloc extends Bloc<UsersDetailEvent, UsersDetailState> {
  UsersDetailBloc() : super(const UsersDetailState()) {
    _statusStream = userRepository2.status.listen((event) {
      log('message ::: from stream Subscribtion :: $event');
    });

    // on<LoadUsers>(
    //   _onLoadUsers,
    //   transformer: throttleDroppable(throttleDuration),
    // );
    on<LoadUserDetail>(_onLoadUserDetail);
    // on<RemoveUsers>(_onRemoveUser);
    // on<AddUsers>(_onAddUser);
  }

  final UserRepository2 userRepository2 = UserRepository2(UserLocal());
  StreamSubscription? _statusStream;

  Future<void> _onLoadUserDetail(
    LoadUserDetail event,
    Emitter<UsersDetailState> emit,
  ) async {
    emit(state.copy(status: UsersDetailStatus.loading));
    log('message :: state.users.length :::');
    await emit.forEach<User>(
      userRepository2.getUser(event.userId),
      onData: (user) => state.copy(
        status: UsersDetailStatus.success,
        user: user,
      ),
      onError: (_, __) => state.copy(
        status: UsersDetailStatus.failure,
      ),
    );
  }

  // Future<void> _onRemoveUser(
  //   RemoveUsers event,
  //   Emitter<UsersDetailState> emit,
  // ) async {
  //   emit(state.copy(status: UsersDetailStatus.loading));
  //   await userRepository2.deleteUser(User.empty());
  // }

  // Future<void> _onAddUser(AddUsers event, Emitter<UsersDetailState> emit) async {
  //   await userRepository2.addUser(
  //     User.empty().copy(
  //       id: '23u490238409',
  //       title: 'hello',
  //       email: 'good@gmail.com',
  //     ),
  //   );
  // }

  @override
  Future<void> close() async {
    await _statusStream?.cancel();
    return super.close();
  }
}
