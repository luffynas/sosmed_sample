part of 'fcm_bloc.dart';

abstract class FcmEvent extends Equatable {
  const FcmEvent();

  @override
  List<Object> get props => [];
}

class LoadFcm extends FcmEvent {
  final bool force;
  const LoadFcm({this.force = false});

  @override
  String toString() => "LoadFcm";
}

class CreateFcm extends FcmEvent {
  const CreateFcm();
  @override
  String toString() => "CreateFcm";
}

/// Event to delete Fcm
class DeleteFcm extends FcmEvent {
  const DeleteFcm();
  @override
  String toString() => "DeleteFcm";
}
