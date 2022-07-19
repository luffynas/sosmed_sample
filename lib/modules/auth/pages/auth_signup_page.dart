import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/modules/auth/bloc/auth_bloc.dart';
import 'package:sosmed_sample/modules/auth/cubit/auth_page_cubit.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/button_border.dart';
import 'package:sosmed_sample/widgets/progress_loader.dart';
import 'package:sosmed_sample/widgets/text_field_box.dart';

class AuthSignUpPage extends StatefulWidget {
  AuthSignUpPage({Key? key}) : super(key: key);

  @override
  _AuthSignUpPageState createState() => _AuthSignUpPageState();
}

class _AuthSignUpPageState extends State<AuthSignUpPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  late TapGestureRecognizer _tapSingUpRecognizer;
  late TapGestureRecognizer _tapSingInRecognizer;
  late TapGestureRecognizer _tapHelpRecognizer;

  var _textNameController = TextEditingController();
  var _textEmailController = TextEditingController();
  var _textPasswordController = TextEditingController();
  var _textRetypePasswordController = TextEditingController();

  bool _isSecure = false;
  bool _isSecureRetype = false;
  bool _isFieldError = false;
  String _errorInfo = "";

  @override
  void initState() {
    _tapSingUpRecognizer = TapGestureRecognizer()..onTap = _handlePressSignup;
    _tapSingInRecognizer = TapGestureRecognizer()..onTap = _handleSignInPress;
    _tapHelpRecognizer = TapGestureRecognizer()..onTap = _handleHelpPress;
    super.initState();
  }

  @override
  void dispose() {
    _tapSingUpRecognizer.dispose();
    _tapSingInRecognizer.dispose();
    _tapHelpRecognizer.dispose();
    super.dispose();
  }

  // void _handleSignupPress() {
  //   HapticFeedback.vibrate();
  //   //navigate to verify otp
  //   print('_handlePress');
  //   BlocProvider.of<AuthPageCubit>(context).pageChange(AuthPageType.verify_otp);
  // }
  void _handlePressSignup() {
    // HapticFeedback.vibrate();
    setState(() {
      _isFieldError = false;
    });

    var _fullname = _textNameController.text;
    var _email = _textEmailController.text;
    var _password = _textPasswordController.text;
    var _retypePassword = _textRetypePasswordController.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      BlocProvider.of<AuthBloc>(context).add(SignUp(
        fullname: _fullname,
        email: _email,
        password: _password,
        retypePassword: _retypePassword,
      ));
    }
  }

  void _handleSignInPress() {
    HapticFeedback.vibrate();
    //navigate to verify otp
    print('_handlePress');
    BlocProvider.of<AuthPageCubit>(context).pageChange(AuthPageType.sign_in);
  }

  void _handleHelpPress() {
    HapticFeedback.vibrate();
    print('_tapHelpRecognizer');
  }

  @override
  Widget build(BuildContext context) {
    // handleApiError(context);
    return Container(
      key: _scaffoldKey,
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Stack(
        children: [
          _buildForm(),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 24),
              child: RichText(
                text: TextSpan(
                  text: 'Sudah punya akun? ',
                  style: AppStyle.standart,
                  children: [
                    TextSpan(
                      text: 'Masuk',
                      style: AppStyle.textLink,
                      recognizer: _tapSingInRecognizer,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          FocusScope.of(context).unfocus();
          showLoading(context, 'Please wait...');
        } else if (state is UserWasRegistered) {
          dissmissLoading(context);
          showSnackBar(context, state.message, Status.FAILED);
        } else if (state is RegisterSuccess) {
          dissmissLoading(context);
          Future.delayed(Duration(seconds: 2), () {
            BlocProvider.of<AuthPageCubit>(context).pageChange(
              AuthPageType.verify_otp,
            );
          });
        } else if (state is RegisterFieldError) {
          HapticFeedback.vibrate();
          if (_textNameController.text.isNotEmpty &&
              _textEmailController.text.isNotEmpty &&
              _textPasswordController.text.isNotEmpty &&
              _textRetypePasswordController.text.isNotEmpty) {
            if (state.force) {
              dissmissLoading(context);
            }
          }
          setState(() {
            _errorInfo = state.error!;
            _isFieldError = true;
          });
        } else if (state is RegisterFailure) {
          HapticFeedback.vibrate();
          dissmissLoading(context);
          showSnackBar(context, state.error, Status.FAILED);
        }
      },
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              height: 125.0,
              // decoration: new BoxDecoration(
              //   image: new DecorationImage(
              //     image: new ExactAssetImage("assets/images/ornament.png"),
              //     fit: BoxFit.fitHeight,
              //   ),
              // ),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/edtrons_logo.png"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextFieldBox(
                textController: _textNameController,
                labelText: 'Fullname',
                onSubmited: (value) {
                  print('TextFieldUnderline');
                },
                inputDecoration: inputOutlineDecorationStyle().copyWith(
                  border: InputBorder.none,
                  hintText: "Input your fullname",
                  hintStyle: AppStyle.standart.copyWith(
                    color: Color(0xFFc0c3cb),
                  ),
                ),
              ),
              // child: _EmailInput(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: TextFieldBox(
                textController: _textEmailController,
                labelText: 'Email',
                onSubmited: (value) {
                  print('TextFieldUnderline');
                },
                inputDecoration: inputOutlineDecorationStyle().copyWith(
                  border: InputBorder.none,
                  hintText: "Input your email",
                  hintStyle: AppStyle.standart.copyWith(
                    color: Color(0xFFc0c3cb),
                  ),
                ),
              ),
              // child: _EmailInput(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextFieldBox(
                textController: _textPasswordController,
                labelText: 'Password',
                helperText: 'Contoh: 123123',
                obscureText: _isSecure,
                inputDecoration: inputOutlineDecorationStyle(
                        helper: "Password field must be at least 6 characters")
                    .copyWith(
                  border: InputBorder.none,
                  hintText: "Input your password",
                  hintStyle: AppStyle.standart.copyWith(
                    color: Color(0xFFc0c3cb),
                  ),
                  suffixIcon: IconButton(
                    icon: !_isSecure
                        ? Icon(
                            Icons.visibility,
                            color: Color(0xff039fc0),
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.black12,
                          ),
                    onPressed: () {
                      setState(() {
                        _isSecure = !_isSecure;
                        //print("is show $_isSecure");
                      });
                    },
                  ),
                ),
                onSubmited: (value) {
                  print('TextFieldUnderline');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: TextFieldBox(
                textController: _textRetypePasswordController,
                labelText: 'Retype Password',
                helperText: 'Contoh: 123123',
                obscureText: _isSecureRetype,
                inputDecoration: inputOutlineDecorationStyle(
                  helper: "Retype Password field must be at least 6 characters",
                ).copyWith(
                  border: InputBorder.none,
                  hintText: "Retype your password",
                  hintStyle: AppStyle.standart.copyWith(
                    color: Color(0xFFc0c3cb),
                  ),
                  suffixIcon: IconButton(
                    icon: !_isSecureRetype
                        ? Icon(
                            Icons.visibility,
                            color: Color(0xff039fc0),
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: Colors.black12,
                          ),
                    onPressed: () {
                      setState(() {
                        _isSecureRetype = !_isSecureRetype;
                        //print("is show $_isSecure");
                      });
                    },
                  ),
                ),
                onSubmited: (value) {
                  print('TextFieldUnderline');
                },
              ),
              // child: _EmailInput(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 32),
              width: MediaQuery.of(context).size.width,
              child: ButtonBorder(
                title: 'Daftar',
                buttonType: ButtonType.standard,
                isFill: true,
                onPressed: () {
                  _handlePressSignup();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
