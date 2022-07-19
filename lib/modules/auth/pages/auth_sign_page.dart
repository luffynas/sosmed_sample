import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/modules/auth/bloc/auth_bloc.dart';
import 'package:sosmed_sample/modules/auth/component/auth_header.dart';
import 'package:sosmed_sample/modules/auth/cubit/auth_page_cubit.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/button_border.dart';
import 'package:sosmed_sample/widgets/progress_loader.dart';
import 'package:sosmed_sample/widgets/text_field_box_auth.dart';
import 'package:sosmed_sample/widgets/text_field_underline.dart';

class AuthSignPage extends StatefulWidget {
  AuthSignPage({Key? key}) : super(key: key);

  @override
  _AuthSignPageState createState() => _AuthSignPageState();
}

class _AuthSignPageState extends State<AuthSignPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  late TapGestureRecognizer _tapSingUpRecognizer;
  late TapGestureRecognizer _tapSignInRecognizer;
  late TapGestureRecognizer _tapForgotPasswordRecognizer;
  late TapGestureRecognizer _tapHelpRecognizer;

  bool _isSecure = true;
  bool _isFieldError = false;
  String _errorInfo = "";

  final _textNameController = TextEditingController();
  final _textNicknameController = TextEditingController();
  final _textProviderController = TextEditingController(text: "google");

  @override
  void initState() {
    _tapSingUpRecognizer = TapGestureRecognizer()..onTap = _handlePressSingup;
    _tapSignInRecognizer = TapGestureRecognizer()..onTap = _handlePressLogin;
    _tapForgotPasswordRecognizer = TapGestureRecognizer()
      ..onTap = _handleForgotPasswordPress;
    _tapHelpRecognizer = TapGestureRecognizer()..onTap = _handleHelpPress;
    super.initState();
  }

  @override
  void dispose() {
    _tapSingUpRecognizer.dispose();
    _tapSignInRecognizer.dispose();
    _tapForgotPasswordRecognizer.dispose();
    _tapHelpRecognizer.dispose();
    super.dispose();
  }

  void _handlePressLogin() {
    HapticFeedback.vibrate();
    setState(() {
      _isFieldError = false;
    });

    var _name = _textNameController.text;
    var _nickname = _textNicknameController.text;
    var _provider = _textProviderController.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      BlocProvider.of<AuthBloc>(context).add(SignIn(
        email: _name,
        password: _nickname,
      ));
    }
  }

  void _handlePressSingup() {
    BlocProvider.of<AuthPageCubit>(context).pageChange(AuthPageType.register);
  }

  void _handleForgotPasswordPress() {
    BlocProvider.of<AuthPageCubit>(context).pageChange(
      AuthPageType.forgot_password,
    );
  }

  void _handleHelpPress() {}

  @override
  Widget build(BuildContext context) {
    // handleApiError(context);
    return Container(
      key: _scaffoldKey,
      child: Column(
        children: [
          AuthHeader(
            title: "Selesaikan Akun",
          ),
          ListView(
            shrinkWrap: true,
            children: [
              _buildForm(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    final focus = FocusNode();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            FocusScope.of(context).unfocus();
            showLoading(context, 'Please wait...');
          } else if (state is LoginSuccess) {
            dissmissLoading(context);
          } else if (state is LoginFieldError) {
            HapticFeedback.vibrate();
            // if (_textPasswordController.text.isNotEmpty &&
            //     _textEmailController.text.isNotEmpty) {
            //   if (state.force) {
            //     dissmissLoading(context);
            //   }
            // }
            setState(() {
              _errorInfo = state.error!;
              _isFieldError = true;
            });
          } else if (state is LoginFailure) {
            HapticFeedback.vibrate();
            dissmissLoading(context);
            showSnackBar(context, state.error, Status.FAILED);
          }
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: TextFieldBoxAuth(
                      textController: _textNameController,
                      labelText: 'Display Name',
                      textInputType: TextInputType.name,
                      inputDecoration: inputOutlineDecorationStyle(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        radius: 100,
                      ).copyWith(
                        border: InputBorder.none,
                        hintText: "Input your display name",
                        hintStyle: AppStyle.standart.copyWith(
                          color: Color(0xFFc0c3cb),
                        ),
                        // prefixIcon: Icon(
                        //   AppIcons.ic_profile_log,
                        //   color: Colors.blue,
                        // ),
                      ),
                      onSubmited: (value) {
                        FocusScope.of(context).requestFocus(focus);
                        _handlePressLogin();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFieldBoxAuth(
                      textController: _textNicknameController,
                      labelText: 'Buat username Anda',
                      textInputType: TextInputType.name,
                      inputDecoration: inputOutlineDecorationStyle(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        radius: 100,
                      ).copyWith(
                        border: InputBorder.none,
                        hintText: "Input your username",
                        hintStyle: AppStyle.standart.copyWith(
                          color: Color(0xFFc0c3cb),
                        ),
                        // prefixIcon: Icon(
                        //   AppIcons.ic_at,
                        //   color: Colors.blue,
                        // ),
                      ),
                      onSubmited: (value) {
                        FocusScope.of(context).requestFocus(focus);
                        _handlePressLogin();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TextFieldBoxAuth(
                      // textController: _textProviderController,
                      labelText: 'Daftar melalui',
                      textInputType: TextInputType.name,
                      readOnly: true,
                      inputDecoration: inputOutlineDecorationStyle(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 20,
                        ),
                        radius: 100,
                      ).copyWith(
                        border: InputBorder.none,
                        hintText: "Input your username",
                        hintStyle: AppStyle.standart.copyWith(
                          color: Color(0xFFc0c3cb),
                        ),
                        prefixIcon: Image.asset(
                          'assets/images/menu/ic_google.png',
                        ),
                        // suffixIcon: Icon(
                        //   AppIcons.ic_logout,
                        //   color: Colors.blue,
                        // ),
                      ),
                      onSubmited: (value) {
                        FocusScope.of(context).requestFocus(focus);
                        _handlePressLogin();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 32),
              child: ButtonBorder(
                title: 'Selanjutnya',
                buttonType: ButtonType.big,
                isFill: true,
                radius: 100,
                onPressed: () {
                  FocusScope.of(context).requestFocus(focus);
                  _handlePressLogin();
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 24),
              child: RichText(
                text: TextSpan(
                  text: 'Belum punya akun? ',
                  style: AppStyle.standart,
                  children: [
                    TextSpan(
                      text: 'Daftar',
                      style: AppStyle.textLink,
                      recognizer: _tapSingUpRecognizer,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(buildWhen: (previous, current) {
      if (previous is SignInEmailChanged && current is SignInEmailChanged) {
        return previous.email != current.email;
      }
      return false;
    }, builder: (context, state) {
      return TextFieldUnderline(
        labelText: 'Nomor Ponsel atau Email',
        helperText: 'Contoh: 0813924723',
        onSubmited: (value) {
          print('TextFieldUnderline');
        },
        onChanged: (email) => BlocProvider.of<AuthBloc>(context)
          ..add(SignInEmailChange(email: '$email')),
      );
    });
  }
}
