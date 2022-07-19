part of 'main_bloc.dart';

abstract class MainEvent extends Equatable {
  const MainEvent();

  @override
  List<Object> get props => [];
}

class InitializeApp extends MainEvent {
  const InitializeApp();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return super.toString();
  }
}

class FinishWalktrough extends MainEvent {
  const FinishWalktrough();

  @override
  String toString() {
    return super.toString();
  }
}

// class FinishGoHome extends MainEvent {
//   const FinishGoHome();

//   @override
//   String toString() {
//     return super.toString();
//   }
// }

class LoggedIn extends MainEvent {
  // final String token;
  final bool skip;

  const LoggedIn({this.skip = false});

  @override
  List<Object> get props => [skip];

  @override
  String toString() => 'LoggedIn { token: }:, skip : $skip';
}

class Logout extends MainEvent {
  const Logout();

  @override
  String toString() {
    return super.toString();
  }
}

class ReAuthenticate extends MainEvent {
  const ReAuthenticate();

  @override
  String toString() {
    return super.toString();
  }
}
