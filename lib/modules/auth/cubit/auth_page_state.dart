part of 'auth_page_cubit.dart';

abstract class AuthPageState extends Equatable {
  const AuthPageState();

  @override
  List<Object> get props => [];
}

class AuthPageInitial extends AuthPageState {}

class FirstPage extends AuthPageState {
  @override
  List<Object> get props => [];
}

class SignInPage extends AuthPageState {
  @override
  List<Object> get props => [];
}

class SignInGooglePage extends AuthPageState {
  @override
  List<Object> get props => [];
}

class SignInFacebookPage extends AuthPageState {
  @override
  List<Object> get props => [];
}

class RegisterPage extends AuthPageState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordPage extends AuthPageState {
  @override
  List<Object> get props => [];
}

class VerifyOtpPage extends AuthPageState {
  @override
  List<Object> get props => [];
}

class CompleteProfilePage extends AuthPageState {
  const CompleteProfilePage({required this.user});
  final User user;
  @override
  List<Object> get props => [];
}
