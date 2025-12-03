// Task 8: Integration Test - Sign-In Flow
// Abdusamad Nigmatov
// 220063

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:lab12/main.dart' as app;
import 'package:lab12/login_screen.dart';
import 'package:lab12/home_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Sign-In Flow Integration Test', () {
    testWidgets('complete sign-in flow should navigate to home screen', (WidgetTester tester) async {
      // Arrange: Start app
      app.main();
      await tester.pumpAndSettle();

      // Navigate to login screen
      await tester.tap(find.text('Task 3: Login Form'));
      await tester.pumpAndSettle();

      // Act: Fill email and password fields using tester.enterText()
      await tester.enterText(
        find.byType(TextFormField).first,
        'test@example.com',
      );
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byType(TextFormField).last,
        'password123',
      );
      await tester.pumpAndSettle();

      // Act: Tap sign-in button and wait for navigation transition
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle(const Duration(seconds: 2));

      // Assert: Assert that home screen widget is present after login
      expect(find.byType(HomeScreen), findsOneWidget);
      expect(find.text('Welcome!'), findsOneWidget);
      expect(find.text('Logged in as: test@example.com'), findsOneWidget);
    });

    testWidgets('should show validation errors for empty fields', (WidgetTester tester) async {
      // Arrange
      app.main();
      await tester.pumpAndSettle();

      await tester.tap(find.text('Task 3: Login Form'));
      await tester.pumpAndSettle();

      // Act: Try to submit without entering data
      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      // Assert
      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);
    });
  });
}

