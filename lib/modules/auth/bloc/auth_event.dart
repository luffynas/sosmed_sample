part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class PageChange extends AuthEvent {
  final AuthPageType authPageType;
  const PageChange({required this.authPageType});

  @override
  List<Object> get props => [authPageType];

  @override
  String toString() {
    return super.toString();
  }
}

class SignInEmailChange extends AuthEvent {
  final String email;
  const SignInEmailChange({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() {
    return super.toString();
  }
}

class SignInPhoneChange extends AuthEvent {
  final String phone;
  const SignInPhoneChange({required this.phone});

  @override
  List<Object> get props => [phone];

  @override
  String toString() {
    return super.toString();
  }
}

class SignIn extends AuthEvent {
  const SignIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];

  @override
  String toString() =>
      'LoginButtonPressed { email: $email, password: $password }';
}

class SignInWithProvider extends AuthEvent {
  const SignInWithProvider({
    required this.email,
    required this.provider,
  });

  final String email;
  final AuthProvider provider;

  @override
  List<Object> get props => [email, provider.name];

  @override
  String toString() =>
      'LoginButtonPressed { email: $email provider: ${provider.name} }';
}

class SignUp extends AuthEvent {
  const SignUp({
    required this.fullname,
    required this.email,
    required this.password,
    required this.retypePassword,
  });

  final String fullname;
  final String email;
  final String password;
  final String retypePassword;

  @override
  List<Object> get props => [fullname, email, password, retypePassword];

  @override
  String toString() =>
      'LoginButtonPressed { email: $email, password: $password }';
}

class VerifyOtp extends AuthEvent {
  const VerifyOtp({
    required this.code,
  });

  final String code;

  @override
  List<Object> get props => [code];

  @override
  String toString() => 'VerifyButtonPressed { code: $code }';
}
