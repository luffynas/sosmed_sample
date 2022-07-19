import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sosmed_sample/core/api/app_api.dart';
import 'package:sosmed_sample/core/exception/app_exception.dart';

part 'fcm_event.dart';
part 'fcm_state.dart';

class FcmBloc extends Bloc<FcmEvent, FcmState> {
  FcmBloc() : super(FcmLoading()) {
    on<CreateFcm>(_mapCreateFcmToState);
    on<DeleteFcm>(_mapDeleteToState);
  }

  Future<void> _mapCreateFcmToState(
    CreateFcm event,
    Emitter<FcmState> emit,
  ) async {
    emit(FcmLoading());

    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      log('APP_ID CREATE: $fcmToken');
      final data = await PublicApi.post('/auth/add_token', data: {
        'token': fcmToken,
        'provider_name': Platform.isAndroid ? 'android' : 'iOS'
      });
    } on AppException catch (error) {
      //print("error AppException bloc $error");
      // yield FcmFailure(error: error.toString());
    } catch (error) {
      //print("error2 $error");
      // yield FcmFailure(error: "Cannot add Fcm");
    }
  }

  Future<void> _mapDeleteToState(
    DeleteFcm event,
    Emitter<FcmState> emit,
  ) async {
    emit(FcmLoading());

    try {
      final fcmToken = await FirebaseMessaging.instance.getToken();
      log("APP_ID DELETE: $fcmToken");
      final data = await PublicApi.post("/auth/delete_token", data: {
        "token": fcmToken,
        "provider_name": Platform.isAndroid ? "android" : "iOS"
      });
      await Future.delayed(Duration(seconds: 2));

      if (data != null) {
        FirebaseMessaging.instance.deleteToken();
      }
    } on AppException catch (_) {
    } catch (error) {}
  }
}
