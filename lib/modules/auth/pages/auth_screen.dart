import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/core/bloc/main_bloc.dart';
import 'package:sosmed_sample/modules/auth/cubit/auth_page_cubit.dart';
import 'package:sosmed_sample/modules/auth/pages/auth_complete_profile_page.dart';
import 'package:sosmed_sample/modules/auth/pages/auth_first_page.dart';
import 'package:sosmed_sample/modules/auth/pages/auth_password_reset_page.dart';
import 'package:sosmed_sample/modules/auth/pages/auth_sign_page.dart';
import 'package:sosmed_sample/modules/auth/pages/auth_signup_page.dart';
import 'package:sosmed_sample/modules/auth/pages/auth_verify_otp_page.dart';

class AuthScreen extends StatefulWidget {
  final Function(BuildContext, bool)? onSuccess;
  const AuthScreen({Key? key, this.onSuccess}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int page = 1;

  Future<bool> _onBackPressed(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            content:
                Text('Are you sure want to cancel reset password process?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text('Cancel')),
              SizedBox(height: 16),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: Text('OK')),
            ],
          ),
        ) ??
        false;
  }

  Future<bool> onWillPop() async {
    if (page != 1) {
      BlocProvider.of<MainBloc>(context).add(const Logout());
      BlocProvider.of<AuthPageCubit>(context)
        ..pageChange(AuthPageType.first_screen);
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(top: 24),
          child: BlocBuilder<AuthPageCubit, AuthPageState>(
            builder: (context, state) {
              if (state is RegisterPage) {
                page = 6;
                return AuthSignUpPage();
              } else if (state is ForgotPasswordPage) {
                page = 5;
                return AuthPasswordResetPage();
              } else if (state is VerifyOtpPage) {
                page = 4;
                return AuthVerifyOtpPage();
              } else if (state is SignInPage) {
                page = 3;
                return AuthSignPage();
              } else if (state is CompleteProfilePage) {
                page = 2;
                return AuthCompleteProfilePage(
                  user: state.user,
                  onSuccess: widget.onSuccess,
                );
              } else {
                page = 1;
                return const AuthFirstPage();
              }
            },
          ),
        ),
      ),
    );
  }
}

class AuthActionAppBar extends StatelessWidget {
  const AuthActionAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthPageCubit, AuthPageState>(builder: (context, state) {
      if (state is SignInPage) {
        return Text('Daftar');
      } else if (state is RegisterPage) {
        return Text('Login');
      } else {
        return SizedBox();
      }
    });
  }
}

class AuthTitleAppBar extends StatelessWidget {
  const AuthTitleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthPageCubit, AuthPageState>(builder: (context, state) {
      if (state is RegisterPage) {
        return Text('Daftar');
      } else if (state is ForgotPasswordPage) {
        return Text('Forgot Password');
      } else if (state is VerifyOtpPage) {
        return Text('Verify OTP');
      } else {
        return Text('Login');
      }
    });
  }
}
