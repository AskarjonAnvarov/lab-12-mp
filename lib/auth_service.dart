// Task 4: Auth Service for unit testing with mocking

class AuthService {
  Future<AuthResult> signIn(String email, String password) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Simulate authentication logic
    if (email.isEmpty || password.isEmpty) {
      throw AuthException('Email and password are required');
    }
    
    if (email == 'test@example.com' && password == 'password123') {
      return AuthResult.success(userId: '123', email: email);
    }
    
    throw AuthException('Invalid email or password');
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}

class AuthResult {
  final bool isSuccess;
  final String? userId;
  final String? email;
  final String? errorMessage;

  AuthResult.success({required this.userId, required this.email})
      : isSuccess = true,
        errorMessage = null;

  AuthResult.failure(this.errorMessage)
      : isSuccess = false,
        userId = null,
        email = null;
}

class AuthException implements Exception {
  final String message;
  AuthException(this.message);

  @override
  String toString() => message;
}

