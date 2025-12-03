// Task 4: Unit Test with Mocking - Auth Logic
// Abdusamad Nigmatov
// 220063

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:lab12/auth_service.dart';

// Generate mock class
@GenerateMocks([AuthService])
import 'auth_service_test.mocks.dart';

void main() {
  group('Auth Service Tests', () {
    late MockAuthService mockAuthService;

    setUp(() {
      mockAuthService = MockAuthService();
    });

    test('should return success result when login is successful', () async {
      // Arrange: Mock signIn() method and simulate successful login
      when(mockAuthService.signIn('test@example.com', 'password123'))
          .thenAnswer((_) async => AuthResult.success(
                userId: '123',
                email: 'test@example.com',
              ));

      // Act
      final result = await mockAuthService.signIn('test@example.com', 'password123');

      // Assert: Verify proper error handling logic
      expect(result.isSuccess, isTrue);
      expect(result.userId, equals('123'));
      expect(result.email, equals('test@example.com'));
      expect(result.errorMessage, isNull);

      // Verify the method was called
      verify(mockAuthService.signIn('test@example.com', 'password123')).called(1);
    });

    test('should throw exception when login fails', () async {
      // Arrange: Simulate login failure
      when(mockAuthService.signIn('wrong@example.com', 'wrongpassword'))
          .thenThrow(AuthException('Invalid email or password'));

      // Act & Assert: Verify proper error handling logic
      expect(
        () => mockAuthService.signIn('wrong@example.com', 'wrongpassword'),
        throwsA(isA<AuthException>()),
      );

      // Verify no real network calls are made; keep test fully isolated
      verify(mockAuthService.signIn('wrong@example.com', 'wrongpassword')).called(1);
    });

    test('should handle empty credentials', () async {
      // Arrange
      when(mockAuthService.signIn('', ''))
          .thenThrow(AuthException('Email and password are required'));

      // Act & Assert
      expect(
        () => mockAuthService.signIn('', ''),
        throwsA(isA<AuthException>()),
      );
    });

    test('should verify signOut is called', () async {
      // Arrange
      when(mockAuthService.signOut()).thenAnswer((_) async => {});

      // Act
      await mockAuthService.signOut();

      // Assert
      verify(mockAuthService.signOut()).called(1);
    });
  });

  group('Real AuthService Tests', () {
    late AuthService authService;

    setUp(() {
      authService = AuthService();
    });

    test('should successfully authenticate with correct credentials', () async {
      // Act
      final result = await authService.signIn('test@example.com', 'password123');

      // Assert
      expect(result.isSuccess, isTrue);
      expect(result.userId, equals('123'));
    });

    test('should fail authentication with incorrect credentials', () async {
      // Act & Assert
      expect(
        () => authService.signIn('wrong@example.com', 'wrong'),
        throwsA(isA<AuthException>()),
      );
    });
  });
}

