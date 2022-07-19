//Copyright (c) 2022, Technosantra
//
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sosmed_sample/bootstrap.dart';
import 'package:sosmed_sample/main_app.dart';
import 'package:sosmed_sample/models/user.dart';
import 'package:sosmed_sample/utils/preference.dart';

void main() async {
  // ignore: omit_local_variable_types

  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');

  await dotenv.load(fileName: ".env");
  await SpUtils.getInstance();

  // bootstrap(
  //   () => DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (ctx) => App(),
  //   ),
  // );
  bootstrap(MainApp.new);
}
