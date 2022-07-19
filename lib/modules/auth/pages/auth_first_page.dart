import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/core/bloc/main_bloc.dart';
import 'package:sosmed_sample/modules/auth/bloc/auth_bloc.dart';
import 'package:sosmed_sample/modules/auth/cubit/auth_page_cubit.dart';
import 'package:sosmed_sample/theme/color.dart';
import 'package:sosmed_sample/theme/style.dart';
import 'package:sosmed_sample/utils/preference.dart';
import 'package:sosmed_sample/widgets/progress_loader.dart';

class AuthFirstPage extends StatefulWidget {
  const AuthFirstPage({super.key});

  @override
  _AuthFirstPageState createState() => _AuthFirstPageState();
}

class _AuthFirstPageState extends State<AuthFirstPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  late TapGestureRecognizer _tapHelpRecognizer;

  @override
  void initState() {
    _tapHelpRecognizer = TapGestureRecognizer()..onTap = _handleSkipPressed;
    super.initState();
  }

  @override
  void dispose() {
    _tapHelpRecognizer.dispose();
    super.dispose();
  }

  void _handleSkipPressed() {
    HapticFeedback.vibrate();
    spUtils.putBool('skip', true);
    BlocProvider.of<MainBloc>(context).add(const LoggedIn(skip: true));
  }

  @override
  Widget build(BuildContext context) {
    // handleApiError(context);
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          FocusScope.of(context).unfocus();
          showLoading(context, 'Please wait...');
        } else if (state is CompleteProfile) {
          dissmissLoading(context);
          Future.delayed(Duration(seconds: 2), () {
            BlocProvider.of<AuthPageCubit>(context).pageChange(
              AuthPageType.complete_profile,
              user: state.user,
            );
          });
        } else if (state is LoginSuccess) {
          dissmissLoading(context);
        } else if (state is LoginFailure) {
          HapticFeedback.vibrate();
          dissmissLoading(context);
          showSnackBar(context, state.error, Status.FAILED);
        }
      },
      child: Container(
        key: _scaffoldKey,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text('ID'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    child: Text(
                      'Saya adalah..',
                      style: AppStyle.medium.copyWith(
                        fontSize: 24,
                        color: AppColors.primary,
                      ),
                      textAlign: TextAlign.center,
                      textScaleFactor: 1,
                    ),
                  ),
                  const SizedBox(height: 40),
                  FirstMenuItemView(
                    image: 'assets/images/ic_guru.png',
                    title: 'Guru',
                    backgroundColor: const Color(0xFFFEA14B),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  FirstMenuItemView(
                    image: 'assets/images/ic_student.png',
                    title: 'Siswa',
                    backgroundColor: const Color(0xFF16B6CC),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),
                  FirstMenuItemView(
                    image: 'assets/images/ic_guardian.png',
                    title: 'Wali Murid',
                    backgroundColor: const Color(0xFF93A5FF),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstMenuItemView extends StatelessWidget {
  final String image;
  final String title;
  final Color? backgroundColor;
  final Function() onPressed;
  const FirstMenuItemView({
    Key? key,
    required this.image,
    required this.title,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: backgroundColor,
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/ornament/ic_ornament_1.png',
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset(
                    image,
                    height: 80,
                    width: 127,
                  ),
                  const SizedBox(width: 16),
                  Center(
                    child: Text(
                      'Guru',
                      style: AppStyle.bold.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
