import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sosmed_sample/core/bloc/main_bloc.dart';
import 'package:sosmed_sample/modules/auth/pages/auth_screen.dart';
import 'package:sosmed_sample/modules/home/view/home_view.dart';
import 'package:sosmed_sample/modules/splash/splash_page.dart';
import 'package:sosmed_sample/modules/walkthrough/walkthrough_screen.dart';

class InitializeScreen extends StatelessWidget {
  const InitializeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        log('message ::: $state');
        switch (state.mainType) {
          case MainType.onboarding:
            return const WalkthroughScreen();
          case MainType.unauthenticated:
            return const AuthScreen();
          case MainType.authenticated:
            return HomeView();
          default:
            return SplashPage();
        }
      },
    );
  }
}
