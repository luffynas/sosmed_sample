// //Copyright (c) 2022, Technosantra
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:auto_route/auto_route.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sosmed_sample/core/bloc/fcm/fcm_bloc.dart';
import 'package:sosmed_sample/core/bloc/main_bloc.dart';
import 'package:sosmed_sample/l10n/l10n.dart';
import 'package:sosmed_sample/modules/auth/bloc/auth_bloc.dart';
import 'package:sosmed_sample/modules/auth/cubit/auth_page_cubit.dart';
import 'package:sosmed_sample/modules/home/bloc/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:sosmed_sample/modules/home/bloc/filter/query_filter_bloc.dart';
import 'package:sosmed_sample/modules/home/bloc/home/home_bloc.dart';
import 'package:sosmed_sample/modules/news/bloc/news/news_bloc.dart';
import 'package:sosmed_sample/modules/user/bloc/users/users_bloc.dart';
import 'package:sosmed_sample/route/router.gr.dart' as Router;
import 'package:sosmed_sample/theme/cubit/theme_cubit.dart';
import 'package:sosmed_sample/theme/theme_app.dart';

GetIt getIt = GetIt.instance;

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final _rootRouter = getIt<Router.AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..changeTheme()),
        BlocProvider(
          create: (context) => FcmBloc(),
        ),
        BlocProvider(
          create: (context) => MainBloc(
            fcmBloc: BlocProvider.of<FcmBloc>(context),
          )..add(const InitializeApp()),
        ),
        BlocProvider(
          create: (context) => BottomNavigationBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => QueryFilterBloc(),
        ),
        BlocProvider(
          create: (context) =>
              AuthBloc(mainBloc: BlocProvider.of<MainBloc>(context)),
        ),
        BlocProvider(
          create: (context) => AuthPageCubit(),
        ),
        BlocProvider(
          create: (context) => UsersBloc(),
        ),
        BlocProvider(
          create: (context) => NewsBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        // builder: (context, state) {
        //   return MaterialApp(
        //     useInheritedMediaQuery: true,
        //     locale: DevicePreview.locale(context),
        //     builder: DevicePreview.appBuilder,
        //     theme: state is ThemeLight ? themeLight() : themeDark(),
        //     localizationsDelegates: const [
        //       AppLocalizations.delegate,
        //       GlobalMaterialLocalizations.delegate,
        //     ],
        //     supportedLocales: AppLocalizations.supportedLocales,
        //     // home: const CounterPage(),
        //     home: SearchForm(),
        //   );
        // },
        builder: (context, state) {
          return OverlaySupport.global(
            child: RefreshConfiguration(
              footerTriggerDistance: 15,
              dragSpeedRatio: 0.91,
              headerBuilder: () => const MaterialClassicHeader(),
              footerBuilder: () => const ClassicFooter(),
              shouldFooterFollowWhenNotFull: (state) {
                return false;
              },
              child: Portal(
                child: MaterialApp.router(
                  title: 'Sosmed',
                  useInheritedMediaQuery: true,
                  debugShowCheckedModeBanner: false,
                  routeInformationParser: _rootRouter.defaultRouteParser(),
                  routerDelegate: AutoRouterDelegate(
                    _rootRouter,
                    navigatorObservers: () => [AutoRouteObserver(), observer],
                  ),
                  // builder: (context, widget) => Theme(
                  //   data: state is ThemeLight ? themeLight() : themeDark(),
                  //   child: widget!,
                  // ),
                  theme: state is ThemeLight ? themeLight() : themeDark(),
                  builder: DevicePreview.appBuilder,
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: const Locale('id', 'ID'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
