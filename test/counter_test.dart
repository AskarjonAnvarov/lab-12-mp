// Task 2: Widget Test - Counter App
// Abdusamad Nigmatov
// 220063

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab12/counter_screen.dart';

void main() {
  group('Counter App Widget Tests', () {
    testWidgets('should display initial counter value as 0', (WidgetTester tester) async {
      // Arrange & Act: Pump the widget
      await tester.pumpWidget(
        const MaterialApp(home: CounterScreen()),
      );

      // Assert: Verify displayed text equals '0'
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });

    testWidgets('should increment counter when button is tapped', (WidgetTester tester) async {
      // Arrange: Pump the widget
      await tester.pumpWidget(
        const MaterialApp(home: CounterScreen()),
      );

      // Assert: Initial value is 0
      expect(find.text('0'), findsOneWidget);

      // Act: Simulate tap on increment button using tester.tap()
      await tester.tap(find.text('Increment'));
      await tester.pump(); // Rebuild widget tree

      // Assert: Text updates to '1'
      expect(find.text('0'), findsNothing);
      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('should increment multiple times correctly', (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        const MaterialApp(home: CounterScreen()),
      );

      // Act & Assert: Tap multiple times
      for (int i = 1; i <= 5; i++) {
        await tester.tap(find.text('Increment'));
        await tester.pump();
        expect(find.text('$i'), findsOneWidget);
      }
    });

    testWidgets('should find increment button', (WidgetTester tester) async {
      // Arrange & Act
      await tester.pumpWidget(
        const MaterialApp(home: CounterScreen()),
      );

      // Assert
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('Increment'), findsOneWidget);
    });
  });
}

