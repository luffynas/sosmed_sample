part of 'fcm_bloc.dart';

abstract class FcmState extends Equatable {
  const FcmState();

  @override
  List<Object> get props => [];
}

/// Loading state
class FcmLoading extends FcmState {
  /// Set true to block screen with blocking loading modal box.
  final bool block;
  const FcmLoading({this.block = false});
  @override
  String toString() => "FcmLoading";
}

class FcmListLoading extends FcmState {
  @override
  String toString() => "FcmListLoading";
}

class FcmFailure extends FcmState {
  final String error;
  const FcmFailure({required this.error}) : super();

  @override
  String toString() => "FcmFailure";
}

class FcmCreated extends FcmState {
  final String item;
  const FcmCreated(this.item);
  @override
  String toString() => "FcmCreated";
}

/// State when Fcm already deleted
class FcmDeleted extends FcmState {
  const FcmDeleted();
  @override
  String toString() => "FcmDeleted";
}
