//Copyright (c) 2022, Technosantra
//
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter_test/flutter_test.dart';
import 'package:sosmed_sample/main_app.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(MainApp());
      // expect(find.byType(SearchForm), findsOneWidget);
    });
  });
}
