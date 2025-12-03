// Task 3: Widget Test - Login Form Validation
// Abdusamad Nigmatov
// 220063

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab12/login_screen.dart';

void main() {
  group('Login Form Widget Tests', () {
    testWidgets('should show required field errors when fields are empty', (WidgetTester tester) async {
      // Arrange & Act: Pump the widget
      await tester.pumpWidget(
        const MaterialApp(home: LoginScreen()),
      );

      // Act: Try to submit without entering any data
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Assert: Check for required-field errors
      expect(find.text('Email is required'), findsOneWidget);
      expect(find.text('Password is required'), findsOneWidget);
    });

    testWidgets('should show error for invalid email format', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(home: LoginScreen()),
      );

      // Act: Enter invalid email
      await tester.enterText(find.byType(TextFormField).first, 'invalid-email');
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Assert: Verify correct error message
      expect(find.text('Please enter a valid email address'), findsOneWidget);
    });

    testWidgets('should show error for short password', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(home: LoginScreen()),
      );

      // Act: Enter valid email but short password
      await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, '123');
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Assert
      expect(find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    testWidgets('should enable submit button with valid data', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(home: LoginScreen()),
      );

      // Act: Enter valid data
      await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      
      // Submit button should be enabled
      final submitButton = find.text('Sign In');
      expect(tester.widget<ElevatedButton>(submitButton).onPressed, isNotNull);

      // Act: Submit the form
      await tester.tap(submitButton);
      await tester.pump();

      // Assert: No validation errors should appear
      expect(find.text('Email is required'), findsNothing);
      expect(find.text('Password is required'), findsNothing);
      expect(find.text('Please enter a valid email address'), findsNothing);
    });

    testWidgets('should display loading indicator during submission', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(home: LoginScreen()),
      );

      // Act: Enter valid data and submit
      await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
      await tester.enterText(find.byType(TextFormField).last, 'password123');
      await tester.tap(find.text('Sign In'));
      await tester.pump();

      // Assert: Loading indicator should appear
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      
      // Wait for submission to complete
      await tester.pumpAndSettle();
    });
  });
}

