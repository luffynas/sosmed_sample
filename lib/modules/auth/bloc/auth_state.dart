part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class LoginSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

class CompleteProfile extends AuthState {
  const CompleteProfile({
    required this.user,
  });

  final User user;
  @override
  List<Object> get props => [user];
}

class LoginFailure extends AuthState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}

class LoginFieldError extends AuthState {
  final String? error;
  final bool force;
  const LoginFieldError({this.error, this.force = false});
  @override
  String toString() => "LoginFieldError";

  @override
  List<Object?> get props => [];
}

class RegisterLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterSuccess extends AuthState {
  @override
  List<Object> get props => [];
}

class UserWasRegistered extends AuthState {
  UserWasRegistered({required this.message});

  final String message;
  @override
  List<Object> get props => [];
}

class RegisterFailure extends AuthState {
  final String error;

  const RegisterFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RegisterFailure { error: $error }';
}

class RegisterFieldError extends AuthState {
  final String? error;
  final bool force;
  const RegisterFieldError({this.error, this.force = false});
  @override
  String toString() => "RegisterFieldError";

  @override
  List<Object?> get props => [];
}

class VerifyOtpLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class VerifyOtpSuccess extends AuthState {
  VerifyOtpSuccess({required this.message});

  final String message;
  @override
  List<Object> get props => [message];
}

class VerifyOtpFailure extends AuthState {
  final String error;

  const VerifyOtpFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'VerifyOtpFailure { error: $error }';
}

class VerifyOtpFieldError extends AuthState {
  final String? error;
  final bool force;
  const VerifyOtpFieldError({this.error, this.force = false});
  @override
  String toString() => "VerifyOtpFieldError";

  @override
  List<Object?> get props => [];
}

class SignInPage extends AuthState {
  @override
  List<Object> get props => [];
}

class RegisterPage extends AuthState {
  @override
  List<Object> get props => [];
}

class ForgotPasswordPage extends AuthState {
  @override
  List<Object> get props => [];
}

class VerifyOtpPage extends AuthState {
  @override
  List<Object> get props => [];
}

class SignInEmailChanged extends AuthState {
  final Email email;
  final FormzStatus status;
  const SignInEmailChanged({required this.email, required this.status});

  @override
  List<Object> get props => [email, status];
}

class SignInPhoneChanged extends AuthState {
  final Phone phone;
  final FormzStatus status;
  const SignInPhoneChanged({required this.phone, required this.status});

  @override
  List<Object> get props => [phone, status];
}

class SignInNow extends AuthState {
  final Email email;
  final Phone phone;
  final Password password;
  final FormzStatus status;

  const SignInNow({
    this.email = const Email.pure(),
    this.phone = const Phone.pure(),
    this.password = const Password.pure(),
    this.status = FormzStatus.pure,
  });

  @override
  List<Object> get props => [email, phone, status];

  SignInNow copyWith({
    Email? email,
    Password? password,
    Phone? phone,
    FormzStatus? status,
  }) {
    return SignInNow(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
