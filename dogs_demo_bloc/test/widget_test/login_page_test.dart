import 'package:dogs_demo_bloc/features/login/blocs/login_bloc.dart';
import 'package:dogs_demo_bloc/features/login/pages/login_page.dart';
import 'package:dogs_demo_bloc/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import '../mocks/login_service_mock.dart';

void main() {
  group('Login page widget test', () {
    late Widget loginWidget;
    late LoginServiceMock loginServiceMock;

    setUpAll(() {
      GetIt.instance;

      loginServiceMock = LoginServiceMock();
      GetIt.I.registerFactory<LoginService>(() => loginServiceMock);

      loginWidget = BlocProvider(
        create: (_) => LoginBloc(),
        child: const MaterialApp(home: Scaffold(body: LoginPage())),
      );
    });

    testWidgets('Login form widget test', (WidgetTester tester) async {
      await tester.pumpWidget(loginWidget);

      await tester.pumpAndSettle();

      final textFields = find.byType(TextFormField);
      final button = find.byType(ElevatedButton);

      expect(textFields, findsNWidgets(2));
      expect(button, findsOneWidget);
    });

    testWidgets('Login success', (WidgetTester tester) async {
      await tester.pumpWidget(loginWidget);

      await tester.pumpAndSettle();

      final textFields = find.byType(TextFormField);
      final button = find.byType(ElevatedButton);

      await tester.enterText(textFields.first, 'eve.holt@reqres.in');
      await tester.enterText(textFields.last, 'cityslicka');

      await tester.tap(button);
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('Welcome!'), findsOneWidget);
    });

    testWidgets('Login error', (WidgetTester tester) async {
      await tester.pumpWidget(loginWidget);

      await tester.pumpAndSettle();

      final textFields = find.byType(TextFormField);
      final button = find.byType(ElevatedButton);

      await tester.enterText(textFields.first, 'peter@klaven');
      await tester.enterText(textFields.last, 'fuhbbm');

      await tester.tap(button);
      await tester.pump(const Duration(seconds: 1));

      expect(find.text('user not found'), findsOneWidget);
    });
  });
}
