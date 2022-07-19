import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/widgets/text_field_box_auth.dart';

import '../component/auth_header.dart';
import '../cubit/auth_page_cubit.dart';

class AuthCompleteProfilePage extends StatefulWidget {
  final User user;
  final Function(BuildContext, bool)? onSuccess;
  AuthCompleteProfilePage({
    Key? key,
    required this.user,
    this.onSuccess,
  }) : super(key: key);

  @override
  _AuthCompleteProfilePageState createState() =>
      _AuthCompleteProfilePageState(user);
}

class _AuthCompleteProfilePageState extends State<AuthCompleteProfilePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  late TapGestureRecognizer _tapSignInRecognizer;

  bool _isSecure = true;
  bool _isFieldError = false;
  String _errorInfo = "";

  final _textNameController = TextEditingController();
  final _textNicknameController = TextEditingController();
  final _textProviderController = TextEditingController();

  User user;

  _AuthCompleteProfilePageState(this.user);

  @override
  void initState() {
    _tapSignInRecognizer = TapGestureRecognizer()
      ..onTap = _handleCompleteProfilePressed;
    super.initState();

    // _textNameController.text = firebaseResponse.displayName ?? "";
    // _textProviderController.text = firebaseResponse.provider!.name;
  }

  @override
  void dispose() {
    _tapSignInRecognizer.dispose();
    super.dispose();
  }

  void _handleCompleteProfilePressed() {
    HapticFeedback.vibrate();
    setState(() {
      _isFieldError = false;
    });

    var _name = _textNameController.text;
    var _nickname = _textNicknameController.text;
    var _provider = _textProviderController.text;

    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();

      // BlocProvider.of<ProfileBloc>(context).add(UsernameSetup(
      //   name: _name,
      //   username: _nickname,
      // ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // handleApiError(context);
    return Container(
      key: _scaffoldKey,
      child: Column(
        children: [
          AuthHeader(
            title: 'Selesaikan Akun',
            onPressed: () {
              BlocProvider.of<AuthPageCubit>(context)
                  .pageChange(AuthPageType.first_screen);
            },
          ),
          Expanded(
              // child: _buildForm()
              child: Text('Hello')),
        ],
      ),
    );
  }

  // Widget _buildForm() {
  //   final focus = FocusNode();
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 32),
  //     child: BlocListener<ProfileBloc, ProfileState>(
  //       listener: (context, state) {
  //         // if (state is UsernameSetupLoading) {
  //         //   FocusScope.of(context).unfocus();
  //         //   showLoading(context, 'Please wait...');
  //         // } else if (state is UsernameSetupSuccess) {
  //         //   dissmissLoading(context);
  //         //   widget.onSuccess?.call(context, true);
  //         //   BlocProvider.of<MainBloc>(context).add(InitializeApp());
  //         // } else if (state is UsernameSetupFailure) {
  //         //   HapticFeedback.vibrate();
  //         //   dissmissLoading(context);
  //         //   // showSnackBar(context, state.error, Status.FAILED);
  //         //   widget.onSuccess?.call(context, false);
  //         // }
  //       },
  //       child: ListView(
  //         shrinkWrap: true,
  //         children: [
  //           Form(
  //             key: _formKey,
  //             child: Column(
  //               children: [
  //                 _buildDisplayName(focus),
  //                 // _buildUsername(focus),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 20),
  //                   child: TextFieldBoxAuth(
  //                     textController: _textProviderController,
  //                     labelText: 'Daftar melalui',
  //                     textInputType: TextInputType.name,
  //                     readOnly: true,
  //                     inputDecoration: inputOutlineDecorationStyle(
  //                       contentPadding: EdgeInsets.symmetric(
  //                         horizontal: 16,
  //                         vertical: 20,
  //                       ),
  //                       radius: 100,
  //                     ).copyWith(
  //                       border: InputBorder.none,
  //                       hintText: "Input your username",
  //                       hintStyle: AppStyle.standart.copyWith(
  //                         color: Color(0xFFc0c3cb),
  //                       ),
  //                     ),
  //                     onSubmited: (value) {
  //                       FocusScope.of(context).requestFocus(focus);
  //                     },
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildDisplayName(FocusNode focus) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: TextFieldBoxAuth(
        textController: _textNameController,
        labelText: 'Display Name',
        textInputType: TextInputType.name,
        style: AppStyle.standart.copyWith(
          fontSize: 16,
          color: Colors.blue,
        ),
        inputDecoration: inputOutlineDecorationStyle(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          radius: 100,
        ).copyWith(
          border: InputBorder.none,
          hintText: 'Input your display name',
          hintStyle: AppStyle.standart.copyWith(
            color: Color(0xFFc0c3cb),
          ),
        ),
        onSubmited: (value) {
          FocusScope.of(context).requestFocus(focus);
        },
      ),
    );
  }
}
