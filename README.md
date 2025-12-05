# Lab 12: Testing & Debugging in Flutter

## Author
Asqarjon Anvarov (220050)

## Project Structure
```
lab-12/
├── lib/
│   ├── main.dart                  # Main app with navigation
│   ├── calculator.dart            # Calculator class for unit tests
│   ├── counter_screen.dart        # Counter app for widget tests
│   ├── login_screen.dart          # Login form for widget tests
│   ├── auth_service.dart          # Auth service for mocking tests
│   ├── buggy_code.dart            # Buggy code with null errors
│   ├── buggy_code_fixed.dart      # Fixed version
│   └── responsive_layout.dart     # Responsive layout demo
├── test/
│   ├── calculator_test.dart       # Task 1: Unit tests
│   ├── counter_test.dart          # Task 2: Widget tests
│   ├── login_test.dart            # Task 3: Widget tests
│   └── auth_service_test.dart     # Task 4: Mocking tests
├── integration_test/
│   └── sign_in_test.dart          # Task 8: Integration tests
├── pubspec.yaml
└── README.md
```

## Dependencies
- `flutter_test` - Built-in Flutter testing framework
- `mockito: ^5.4.4` - Mocking library for unit tests
- `build_runner: ^2.4.7` - Code generator for mockito
- `integration_test` - Integration testing framework

## Tasks Implementation

### Task 1: Unit Test - Calculator.add() (10 points)
- ✅ Comprehensive unit test for Calculator class
- ✅ Multiple test cases with arrange-act-assert structure
- ✅ Tests positive, negative, zero, and mixed-value inputs
- ✅ File: `test/calculator_test.dart`

### Task 2: Widget Test - Counter App (10 points)
- ✅ Widget test for basic Counter application
- ✅ Verifies initial counter value displayed correctly
- ✅ Tests tapping increment button updates the value
- ✅ Proper widget tree pumping and interaction simulation
- ✅ File: `test/counter_test.dart`

### Task 3: Widget Test - Login Form Validation (10 points)
- ✅ Widget test for LoginScreen
- ✅ Checks validation behavior for required fields
- ✅ Tests invalid email format error
- ✅ Verifies successful submit button state
- ✅ File: `test/login_test.dart`

### Task 4: Unit Test with Mocking - Auth Logic (10 points)
- ✅ Unit test that mocks authentication service
- ✅ Tests logic layer without real backend calls
- ✅ Simulates both success and failure responses
- ✅ Uses mockito for dependency isolation
- ✅ File: `test/auth_service_test.dart`

### Task 5: Debugging Exercise - Fix Null Crash (10 points)
- ✅ Buggy code with null pointer errors
- ✅ Fixed version with proper null-safety handling
- ✅ Demonstrates debugging and root-cause analysis
- ✅ Files: `lib/buggy_code.dart` and `lib/buggy_code_fixed.dart`

### Task 6: DevTools Analysis - Excessive Rebuilds (10 points)
- ✅ Demo screen showing rebuild issues
- ✅ Optimized and unoptimized widget examples
- ✅ Instructions for using DevTools Timeline and Inspector
- ✅ File: `lib/main.dart` (RebuildDemoScreen)

### Task 7: Testing on Emulator and Device (10 points)
- ✅ Instructions for running tests on emulator
- ✅ Instructions for running on physical device
- ✅ Documentation for capturing outputs

### Task 8: Integration Test - Sign-In Flow (12 points)
- ✅ Complete integration test script
- ✅ Automates entering email and password
- ✅ Tests pressing sign-in button
- ✅ Verifies login flow completion
- ✅ File: `integration_test/sign_in_test.dart`

### Task 9: Performance Profiling & Optimization (10 points)
- ✅ Performance demo with heavy operations
- ✅ Instructions for capturing performance traces
- ✅ Code examples for optimization
- ✅ File: `lib/main.dart` (PerformanceDemoScreen)

### Task 10: Cross-Device Layout Testing (8 points)
- ✅ Responsive layout for different screen sizes
- ✅ Supports small phone, large phone, tablet portrait, tablet landscape
- ✅ Layout adjustments based on constraints
- ✅ File: `lib/responsive_layout.dart`

## How to Run Tests

### Run All Tests
```bash
flutter test
```

### Run Specific Test File
```bash
flutter test test/calculator_test.dart
flutter test test/counter_test.dart
flutter test test/login_test.dart
flutter test test/auth_service_test.dart
```

### Run Integration Tests
```bash
flutter test integration_test/sign_in_test.dart
```

### Generate Mock Files (Task 4)
After adding mock annotations, generate mock files:
```bash
flutter pub run build_runner build
```

## Running the App

```bash
flutter run
```

## Testing on Different Devices

### Run on Emulator
```bash
flutter run -d emulator-5554
```

### Run on Physical Device
```bash
flutter devices  # List available devices
flutter run -d <device_id>
```

### Run on Specific Platform
```bash
flutter run -d android
flutter run -d ios
flutter run -d chrome  # Web
```

## Task Details

### Task 1: Unit Test Structure
- Arrange: Set up test data and objects
- Act: Execute the method being tested
- Assert: Verify expected outcomes

### Task 2-3: Widget Testing
- Use `testWidgets()` instead of `test()`
- Pump widget tree with `tester.pumpWidget()`
- Interact with widgets using `tester.tap()`, `tester.enterText()`
- Verify UI changes with `find.text()`, `find.byType()`

### Task 4: Mocking with Mockito
1. Add `@GenerateMocks([Class])` annotation
2. Import generated mock file
3. Create mock instances
4. Use `when()` to stub methods
5. Use `verify()` to check method calls

### Task 5: Debugging
- Use Flutter DevTools for stack traces
- Identify null access errors
- Apply null-safety patterns:
  - Null-aware operators (`??`, `?.`)
  - Default values
  - Null checks before use

### Task 6: DevTools Rebuild Analysis
1. Open DevTools: `flutter pub global activate devtools && flutter pub global run devtools`
2. Connect to running app
3. Use Timeline tab to see rebuild counts
4. Use Inspector to identify rebuild sources
5. Optimize with `const`, extracted widgets

### Task 7: Device Testing
- Test on multiple screen sizes
- Verify layout responsiveness
- Check for overflow issues
- Test on different OS versions

### Task 8: Integration Testing
- Tests complete user flows
- Uses `IntegrationTestWidgetsFlutterBinding`
- Waits for async operations with `pumpAndSettle()`
- Verifies navigation and state changes

### Task 9: Performance Profiling
1. Open DevTools Performance tab
2. Start recording
3. Perform actions causing jank
4. Stop recording and analyze
5. Identify expensive operations
6. Optimize with:
   - `ListView.builder` for long lists
   - Extract expensive computations
   - Use `compute()` for heavy calculations

### Task 10: Responsive Layout
- Use `LayoutBuilder` to get constraints
- Adjust layout based on `maxWidth`
- Test on different device sizes
- Use `Flex`, `Expanded`, `FittedBox` for adaptation

## DevTools Setup

### Install DevTools
```bash
flutter pub global activate devtools
```

### Run DevTools
```bash
flutter pub global run devtools
```

Then connect to your running Flutter app.

## Mock Generation

For Task 4, after writing test with `@GenerateMocks`, run:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## Test Coverage

To generate test coverage:
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
```

## Troubleshooting

### Tests not running
- Ensure `flutter_test` is in `dev_dependencies`
- Check file is in `test/` directory
- Verify imports are correct

### Mock generation fails
- Run `flutter pub get` first
- Use `--delete-conflicting-outputs` flag
- Check annotation syntax is correct

### Integration tests fail
- Ensure app is not already running
- Check `IntegrationTestWidgetsFlutterBinding.ensureInitialized()`
- Use `pumpAndSettle()` for async operations

### DevTools connection issues
- Ensure app is running in debug mode
- Check firewall settings
- Use `flutter attach` if needed

## Notes

- All test files follow Flutter testing best practices
- Mock tests are fully isolated from real services
- Integration tests cover complete user flows
- Debugging exercises demonstrate common pitfalls
- Performance demos show optimization techniques

## Verification Checklist

- [ ] All unit tests pass (`flutter test`)
- [ ] All widget tests pass
- [ ] Integration test runs successfully
- [ ] Mock files generated correctly
- [ ] Buggy code reproduces crash
- [ ] Fixed code handles null safely
- [ ] DevTools can analyze rebuilds
- [ ] App runs on emulator
- [ ] App runs on physical device
- [ ] Responsive layout works on different sizes

