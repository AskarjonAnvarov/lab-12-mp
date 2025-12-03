# Lab 12: Quick Start Guide

## Setup (5 minutes)

1. **Install dependencies**:
   ```bash
   cd lab-12
   flutter pub get
   ```

2. **Generate mock files** (for Task 4):
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

3. **Run all tests**:
   ```bash
   flutter test
   ```

## Quick Test Commands

### Task 1: Calculator Unit Test
```bash
flutter test test/calculator_test.dart
```

### Task 2: Counter Widget Test
```bash
flutter test test/counter_test.dart
```

### Task 3: Login Widget Test
```bash
flutter test test/login_test.dart
```

### Task 4: Auth Mocking Test
```bash
# First generate mocks
flutter pub run build_runner build --delete-conflicting-outputs
# Then run test
flutter test test/auth_service_test.dart
```

### Task 8: Integration Test
```bash
flutter test integration_test/sign_in_test.dart
```

## Running the App

```bash
flutter run
```

Navigate through the home screen to access all demo screens.

## DevTools Setup

1. **Install DevTools**:
   ```bash
   flutter pub global activate devtools
   ```

2. **Run app in debug mode**:
   ```bash
   flutter run
   ```

3. **Start DevTools**:
   ```bash
   flutter pub global run devtools
   ```

4. Connect to your running app from the DevTools UI

## Task Verification Checklist

- [ ] Task 1: `flutter test test/calculator_test.dart` - All pass
- [ ] Task 2: `flutter test test/counter_test.dart` - All pass
- [ ] Task 3: `flutter test test/login_test.dart` - All pass
- [ ] Task 4: Generate mocks, then `flutter test test/auth_service_test.dart` - All pass
- [ ] Task 5: Run app, test buggy code (crashes), test fixed code (works)
- [ ] Task 6: Use DevTools Timeline to see rebuilds
- [ ] Task 7: Run app on emulator and physical device
- [ ] Task 8: `flutter test integration_test/sign_in_test.dart` - Passes
- [ ] Task 9: Use DevTools Performance tab to profile
- [ ] Task 10: Test responsive layout on different screen sizes

## All Tests at Once

```bash
flutter test
```

This runs all unit and widget tests. Integration tests need to be run separately.

## Need Help?

See:
- `README.md` - Complete documentation
- `TESTING_GUIDE.md` - Detailed testing instructions
- `TASKS_SUMMARY.md` - Task checklist

