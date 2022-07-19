//Copyright (c) 2022, Technosantra
//
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sosmed_sample/core/db_constant.dart';
import 'package:sosmed_sample/main_app.dart';
import 'package:sosmed_sample/route/router.gr.dart' as Router;
import 'package:sosmed_sample/utils/preference.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();
  await SpUtils.getInstance();

  getIt.registerSingleton<Router.AppRouter>(Router.AppRouter());

  await spUtils.putString('theme', 'light');
  // DatabaseHelper();

  await Hive.initFlutter();
  await Hive.openBox(DBConstant.auth);
  await Hive.openBox(DBConstant.userBox);

  await runZonedGuarded(
    () async {
      await BlocOverrides.runZoned(
        () async => runApp(await builder()),
        blocObserver: AppBlocObserver(),
      );
    },
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
