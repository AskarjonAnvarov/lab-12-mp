# Complete Testing Guide for Lab 12

## Quick Start

1. **Install dependencies**:
   ```bash
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

4. **Run integration tests**:
   ```bash
   flutter test integration_test/sign_in_test.dart
   ```

## Task-by-Task Guide

### Task 1: Unit Test - Calculator.add()

**File**: `test/calculator_test.dart`

**Run test**:
```bash
flutter test test/calculator_test.dart
```

**What to verify**:
- All test cases pass
- Tests cover positive, negative, zero, and mixed values
- Arrange-act-assert structure is clear

### Task 2: Widget Test - Counter App

**File**: `test/counter_test.dart`

**Run test**:
```bash
flutter test test/counter_test.dart
```

**What to verify**:
- Initial counter shows '0'
- Tapping button increments counter
- Multiple increments work correctly

### Task 3: Widget Test - Login Form Validation

**File**: `test/login_test.dart`

**Run test**:
```bash
flutter test test/login_test.dart
```

**What to verify**:
- Empty fields show error messages
- Invalid email format is caught
- Valid data enables submit button

### Task 4: Unit Test with Mocking

**File**: `test/auth_service_test.dart`

**Setup**:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

**Run test**:
```bash
flutter test test/auth_service_test.dart
```

**What to verify**:
- Mock service works without real network calls
- Success and failure scenarios are tested
- Method calls are verified

### Task 5: Debugging Exercise

**Files**: 
- `lib/buggy_code.dart` - Contains null errors
- `lib/buggy_code_fixed.dart` - Fixed version

**Steps**:
1. Run the app and navigate to "Task 5: Debugging Exercise"
2. Select "Buggy Code (Crashes)"
3. Observe the crash and stack trace
4. Analyze the null pointer error
5. Compare with fixed version

**Fix applied**:
- Added null checks with `??` operator
- Added loading state
- Proper null-safety handling

### Task 6: DevTools Rebuild Analysis

**Instructions**:
1. Run app in debug mode:
   ```bash
   flutter run
   ```

2. Open DevTools:
   ```bash
   flutter pub global activate devtools
   flutter pub global run devtools
   ```

3. Connect DevTools to running app

4. Navigate to "Task 6: Rebuild Demo"

5. Open Timeline tab in DevTools

6. Start recording

7. Tap increment button multiple times

8. Stop recording and analyze:
   - Count rebuilds in Timeline
   - Identify unnecessary rebuilds
   - Note optimized vs unoptimized widgets

**Optimizations**:
- Use `const` constructors
- Extract widgets that don't change
- Avoid logic in `build()` method

### Task 7: Testing on Emulator and Device

**On Emulator**:
```bash
# List available emulators
flutter emulators

# Launch emulator
flutter emulators --launch <emulator_id>

# Run app
flutter run -d <emulator_id>
```

**On Physical Device**:
1. Enable USB debugging (Android) or connect via cable (iOS)
2. List devices:
   ```bash
   flutter devices
   ```
3. Run app:
   ```bash
   flutter run -d <device_id>
   ```

**Capture Screenshots**:
- Use device screenshot feature
- Or: `flutter screenshot` command

### Task 8: Integration Test - Sign-In Flow

**File**: `integration_test/sign_in_test.dart`

**Run test**:
```bash
flutter test integration_test/sign_in_test.dart
```

**Or with device**:
```bash
flutter test integration_test/sign_in_test.dart -d <device_id>
```

**What it tests**:
- Complete sign-in flow
- Field input
- Button tapping
- Navigation verification

### Task 9: Performance Profiling

**Setup**:
1. Run app in profile mode:
   ```bash
   flutter run --profile
   ```

2. Open DevTools Performance tab

**Steps**:
1. Navigate to "Task 9: Performance Demo"
2. Start performance recording in DevTools
3. Tap "Generate Heavy List" button
4. Stop recording
5. Analyze the trace:
   - Look for frame drops (jank)
   - Identify expensive operations
   - Check build times

**Optimization**:
- Move heavy computations off UI thread
- Use `compute()` for CPU-intensive tasks
- Implement pagination for large lists

### Task 10: Cross-Device Layout Testing

**File**: `lib/responsive_layout.dart`

**Test on different sizes**:
1. Use Flutter DevTools device preview
2. Or change emulator screen sizes
3. Or use different physical devices

**Screen sizes to test**:
- Small phone: < 600px width
- Large phone: 600-900px width
- Tablet portrait: > 900px width, portrait
- Tablet landscape: > 900px width, landscape

**Layout adjustments**:
- Single column for small screens
- Grid layout for tablets
- Row layout for landscape

## Running Tests

### All Unit and Widget Tests
```bash
flutter test
```

### Specific Test File
```bash
flutter test test/calculator_test.dart
```

### With Coverage
```bash
flutter test --coverage
```

### Integration Tests
```bash
flutter test integration_test/
```

## DevTools Usage

### Install and Run
```bash
flutter pub global activate devtools
flutter pub global run devtools
```

Then open the URL shown in the terminal (usually http://127.0.0.1:9100)

### Connect to App
1. Run app: `flutter run`
2. Open DevTools URL
3. Click "Connect" or the app should auto-connect

### Timeline Tab (Task 6)
- Shows widget rebuilds
- Frame rendering times
- Identify performance bottlenecks

### Performance Tab (Task 9)
- CPU profiling
- Memory usage
- Frame rendering analysis

### Inspector Tab
- Widget tree visualization
- Property inspection
- Layout debugging

## Test Output

### Successful Test Output
```
00:02 +8: All tests passed!
```

### Failed Test Output
Shows which test failed and why, with stack trace.

### Coverage Report
After running `flutter test --coverage`:
```bash
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

## Verification Checklist

- [ ] Task 1: All calculator tests pass
- [ ] Task 2: Counter widget test passes
- [ ] Task 3: Login form tests pass
- [ ] Task 4: Mock tests pass (after generating mocks)
- [ ] Task 5: Buggy code crashes, fixed code works
- [ ] Task 6: DevTools shows rebuild counts
- [ ] Task 7: App runs on emulator and device
- [ ] Task 8: Integration test passes
- [ ] Task 9: Performance trace captured
- [ ] Task 10: Layout works on different sizes

## Common Issues

### Mock files not generated
- Run: `flutter pub run build_runner build --delete-conflicting-outputs`
- Check annotation syntax: `@GenerateMocks([Class])`
- Ensure import: `import 'test_file.mocks.dart';`

### Tests timeout
- Increase timeout in test:
  ```dart
  test('name', () async {
    // test code
  }, timeout: Timeout(Duration(seconds: 30)));
  ```

### Widget test fails to find widget
- Use `pumpAndSettle()` for async operations
- Check widget tree structure
- Use `find.byType()` or `find.byKey()` if needed

### Integration test fails
- Ensure `IntegrationTestWidgetsFlutterBinding.ensureInitialized()`
- Use longer timeouts for `pumpAndSettle()`
- Check navigation routes are correct

## Tips

1. **Run tests frequently** during development
2. **Write tests before fixing bugs** (TDD approach)
3. **Use descriptive test names** that explain what's being tested
4. **Group related tests** using `group()`
5. **Keep tests isolated** - each test should be independent
6. **Mock external dependencies** to keep tests fast and reliable
7. **Use DevTools regularly** to catch performance issues early

