import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/modules/auth/bloc/auth_bloc.dart';
import 'package:sosmed_sample/modules/auth/cubit/auth_page_cubit.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/button_border.dart';
import 'package:sosmed_sample/widgets/progress_loader.dart';
import 'package:sosmed_sample/widgets/text_field_box.dart';

class AuthVerifyOtpPage extends StatefulWidget {
  AuthVerifyOtpPage({Key? key}) : super(key: key);

  @override
  _AuthVerifyOtpPageState createState() => _AuthVerifyOtpPageState();
}

class _AuthVerifyOtpPageState extends State<AuthVerifyOtpPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  var _textOtpController = TextEditingController();

  bool _isFieldError = false;
  String _errorInfo = "";

  @override
  void initState() {
    super.initState();
  }

  void _handlePressVerifyOtp() {
    // HapticFeedback.vibrate();
    setState(() {
      _isFieldError = false;
    });

    var _code = _textOtpController.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      BlocProvider.of<AuthBloc>(context).add(VerifyOtp(
        code: _code,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // handleApiError(context);
    return Container(
      key: _scaffoldKey,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: _buildForm(),
    );
  }

  Widget _buildForm() {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is VerifyOtpLoading) {
          FocusScope.of(context).unfocus();
          showLoading(context, 'Please wait...');
        } else if (state is VerifyOtpSuccess) {
          dissmissLoading(context);
          showSnackBar(context, state.message, Status.SUCCESS);

          Future.delayed(Duration(seconds: 2), () {
            BlocProvider.of<AuthPageCubit>(context).pageChange(
              AuthPageType.sign_in,
            );
          });
        } else if (state is VerifyOtpFieldError) {
          HapticFeedback.vibrate();
          if (_textOtpController.text.isNotEmpty) {
            if (state.force) {
              dissmissLoading(context);
            }
          }
          setState(() {
            _errorInfo = state.error!;
            _isFieldError = true;
          });
        } else if (state is VerifyOtpFailure) {
          HapticFeedback.vibrate();
          dissmissLoading(context);
          showSnackBar(context, state.error, Status.FAILED);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 32),
            child: Text(
              'Masukkan Kode Verifikasi',
              style: AppStyle.medium14,
              textAlign: TextAlign.center,
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: TextFieldBox(
                textController: _textOtpController,
                // disableLabel: true,
                // disableHelper: true,
                // disableCounter: true,
                inputDecoration: inputOutlineDecorationStyle().copyWith(
                  border: InputBorder.none,
                  hintText: "Input OTP code",
                  hintStyle: AppStyle.standart.copyWith(
                    color: Color(0xFFc0c3cb),
                  ),
                ),
                onSubmited: (value) {
                  print('TextFieldUnderline');
                },
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
            child: ButtonBorder(
              title: 'Verify',
              buttonType: ButtonType.standard,
              isFill: true,
              onPressed: () {
                _handlePressVerifyOtp();
              },
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Text(
              'Mohon tunggu dalam 16 detik untuk kirim ulang kode verifikasi',
              style: AppStyle.caption,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
