// Task 1: Unit Test - Calculator.add()
// Abdusamad Nigmatov
// 220063

import 'package:flutter_test/flutter_test.dart';
import 'package:lab12/calculator.dart';

void main() {
  group('Calculator.add()', () {
    late Calculator calculator;

    setUp(() {
      // Arrange: Create calculator instance before each test
      calculator = Calculator();
    });

    test('should add two positive numbers correctly', () {
      // Arrange
      const double a = 5.0;
      const double b = 3.0;
      const double expected = 8.0;

      // Act
      final result = calculator.add(a, b);

      // Assert
      expect(result, equals(expected));
    });

    test('should add two negative numbers correctly', () {
      // Arrange
      const double a = -5.0;
      const double b = -3.0;
      const double expected = -8.0;

      // Act
      final result = calculator.add(a, b);

      // Assert
      expect(result, equals(expected));
    });

    test('should add positive and negative numbers correctly', () {
      // Arrange
      const double a = 5.0;
      const double b = -3.0;
      const double expected = 2.0;

      // Act
      final result = calculator.add(a, b);

      // Assert
      expect(result, equals(expected));
    });

    test('should handle zero correctly', () {
      // Arrange
      const double a = 5.0;
      const double b = 0.0;
      const double expected = 5.0;

      // Act
      final result = calculator.add(a, b);

      // Assert
      expect(result, equals(expected));
    });

    test('should add zero to zero correctly', () {
      // Arrange
      const double a = 0.0;
      const double b = 0.0;
      const double expected = 0.0;

      // Act
      final result = calculator.add(a, b);

      // Assert
      expect(result, equals(expected));
    });

    test('should handle large numbers correctly', () {
      // Arrange
      const double a = 999999.0;
      const double b = 111111.0;
      const double expected = 1111110.0;

      // Act
      final result = calculator.add(a, b);

      // Assert
      expect(result, equals(expected));
    });

    test('should handle decimal numbers correctly', () {
      // Arrange
      const double a = 5.5;
      const double b = 3.3;
      const double expected = 8.8;

      // Act
      final result = calculator.add(a, b);

      // Assert
      expect(result, closeTo(expected, 0.001));
    });

    test('should handle mixed-value inputs correctly', () {
      // Arrange
      const double a = -10.5;
      const double b = 15.75;
      const double expected = 5.25;

      // Act
      final result = calculator.add(a, b);

      // Assert
      expect(result, closeTo(expected, 0.001));
    });
  });
}

