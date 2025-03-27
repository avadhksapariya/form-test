import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:form_test/main.dart' as app;
import 'package:form_test/screen_home.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets('verify login screen with correct username and password', (widgetTester) async {
      app.main();

      await widgetTester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await widgetTester.enterText(find.byType(TextFormField).at(0), 'username');
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.enterText(find.byType(TextFormField).at(1), 'password');
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(find.byType(ElevatedButton));
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));
      expect(find.byType(ScreenHome), findsOneWidget);
    });

    testWidgets('verify login screen with incorrect username and password', (widgetTester) async {
      app.main();

      await widgetTester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2));

      await widgetTester.enterText(find.byType(TextFormField).at(0), 'avadh');
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.enterText(find.byType(TextFormField).at(1), 'aks123');
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(find.byType(ElevatedButton));
      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));
      expect(find.byType(AlertDialog), findsOneWidget);
    });
  });
}
