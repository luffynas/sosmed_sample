import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sosmed_sample/core/api/api_client.dart';
import 'package:sosmed_sample/core/bloc/fcm/fcm_bloc.dart';
import 'package:sosmed_sample/core/constant.dart';
import 'package:sosmed_sample/modules/user/repositories/user_repository.dart';
import 'package:sosmed_sample/utils/preference.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({required this.fcmBloc}) : super(const MainState()) {
    on<InitializeApp>(_mapInitializeAppToState);
    on<FinishWalktrough>(_mapFinishWalktroughToState);
    on<LoggedIn>(_mapFinishGoHomeToState);
    on<Logout>(_mapLogoutToState);
    on<ReAuthenticate>(_onReAuthenticate);
  }

  final UserRepository userRepository = UserRepository();
  final FcmBloc fcmBloc;

  Future<void> _mapInitializeAppToState(
    InitializeApp event,
    Emitter<MainState> emit,
  ) async {
    await spUtils.putBool(BoxConstant.isFirstApp, false);
    await userRepository.setToken('62d63af2655bac33c568920f');

    final tokenApp = spUtils.getString(BoxConstant.tokenApp);
    final isFirstApp = spUtils.getBool(BoxConstant.isFirstApp);
    final hasToken = await userRepository.hasToken();
    log('message ::: hasToken ::: $hasToken');

    if (isFirstApp == null || isFirstApp) {
      emit(state.copyWith(mainType: MainType.onboarding));
    } else if (hasToken) {
      emit(state.copyWith(mainType: MainType.loading));

      try {
        emit(state.copyWith(mainType: MainType.authenticated));
        // await emit.forEach(
        //   userRepository.getUserInfo(force: true),
        //   onData: (user) {
        //     return state.copyWith(mainType: MainType.authenticated);
        //   },
        //   onError: (_, __) {
        //     return state.copyWith(mainType: MainType.unauthenticated);
        //   },
        // );
      } catch (e) {
        emit(state.copyWith(mainType: MainType.unauthenticated));
      }
    } else {
      emit(state.copyWith(mainType: MainType.unauthenticated));
    }
  }

  Future<void> _mapFinishWalktroughToState(
    FinishWalktrough event,
    Emitter<MainState> emit,
  ) async {
    try {
      await spUtils.putBool(BoxConstant.isFirstApp, false);
      final isFirstApp = spUtils.getBool(BoxConstant.isFirstApp) ?? false;

      await spUtils.putBool(BoxConstant.isFirstApp, false);
      await userRepository.setToken('62d63af2655bac33c568920f');
      log('mainApp save :: $isFirstApp');
      // emit(state.copyWith(mainType: MainType.unauthenticated));
      emit(state.copyWith(mainType: MainType.authenticated));
    } catch (e) {
      log('eeeerorr : $e');
      emit(state.copyWith(mainType: MainType.failure));
    }
  }

  Future<void> _mapFinishGoHomeToState(
    LoggedIn event,
    Emitter<MainState> emit,
  ) async {
    try {
      log('message ::: _mapFinishGoHomeToState');
      emit(state.copyWith(mainType: MainType.authenticated));
    } catch (e) {
      log('eeeerorr : $e');
      emit(state.copyWith(mainType: MainType.failure));
    }
  }

  Future<void> _onReAuthenticate(
    ReAuthenticate event,
    Emitter<MainState> emit,
  ) async {
    state.copyWith(mainType: MainType.loading);

    final hasToken = await userRepository.hasToken();
    if (hasToken) {
      try {
        await emit.forEach(
          userRepository.getUserInfo(force: true),
          onData: (user) {
            return state.copyWith(mainType: MainType.authenticated);
          },
          onError: (_, __) {
            return state.copyWith(mainType: MainType.unauthenticated);
          },
        );
      } catch (e) {
        emit(state.copyWith(mainType: MainType.unauthenticated));
      }
    } else {
      emit(state.copyWith(mainType: MainType.unauthenticated));
    }
  }

  Future<void> _mapLogoutToState(
    Logout event,
    Emitter<MainState> emit,
  ) async {
    emit(state.copyWith(mainType: MainType.loading));
    try {
      await spUtils.clear();
      await spUtils.putBool(BoxConstant.isFirstApp, false);
      fcmBloc.add(const DeleteFcm());

      await userRepository.deleteToken();
      ApiResource.accessToken = '';

      emit(state.copyWith(mainType: MainType.unauthenticated));
    } catch (e) {
      log('eeeerorr : $e');
      emit(state.copyWith(mainType: MainType.failure, message: '$e'));
    }
  }
}
