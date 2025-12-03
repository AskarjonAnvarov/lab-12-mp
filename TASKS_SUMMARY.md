# Lab 12: Tasks Summary

## Complete Task Checklist

### ✅ Task 1: Unit Test - Calculator.add() (10 points)
- [x] Comprehensive unit test for Calculator class
- [x] Multiple test cases (positive, negative, zero, mixed values)
- [x] Arrange-act-assert structure
- [x] File: `test/calculator_test.dart`
- [x] All tests pass without warnings

### ✅ Task 2: Widget Test - Counter App (10 points)
- [x] Widget test for basic Counter application
- [x] Verify initial counter value displayed correctly ('0')
- [x] Simulate tap on increment button using tester.tap()
- [x] Rebuild widget tree and confirm text updates to '1'
- [x] File: `test/counter_test.dart`

### ✅ Task 3: Widget Test - Login Form Validation (10 points)
- [x] Widget test for LoginScreen
- [x] Check for required-field errors when fields are empty
- [x] Enter invalid email and verify correct error message
- [x] Enter valid data and confirm submit button becomes enabled
- [x] File: `test/login_test.dart`

### ✅ Task 4: Unit Test with Mocking - Auth Logic (10 points)
- [x] Unit test that mocks authentication service
- [x] Mock signIn() method and simulate successful login return value
- [x] Simulate login failure and verify proper error handling logic
- [x] Ensure no real network calls are made; keep test fully isolated
- [x] File: `test/auth_service_test.dart`
- [x] Uses mockito for mocking

### ✅ Task 5: Debugging Exercise - Fix Null Crash (10 points)
- [x] Buggy code with null pointer errors
- [x] Reproduce crash and capture stack trace
- [x] Identify which variable caused the null access
- [x] Fix issue using null-checks, default values, and refactoring
- [x] Files: `lib/buggy_code.dart` and `lib/buggy_code_fixed.dart`

### ✅ Task 6: DevTools Analysis - Excessive Rebuilds (10 points)
- [x] Demo screen showing rebuild issues
- [x] Use DevTools Timeline and Inspector to detect rebuild frequency
- [x] Refactor code (add const, extract widgets, remove logic from build())
- [x] File: `lib/main.dart` (RebuildDemoScreen)
- [x] Instructions provided in documentation

### ✅ Task 7: Testing on Emulator and Device (10 points)
- [x] Instructions for running tests on emulator
- [x] Instructions for running on physical device
- [x] Documentation for capturing run outputs and screenshots
- [x] Guide in README.md and TESTING_GUIDE.md

### ✅ Task 8: Integration Test - Sign-In Flow (12 points)
- [x] Complete integration test script
- [x] Fill email and password fields using tester.enterText()
- [x] Tap sign-in button and wait for navigation transition
- [x] Assert that home screen widget is present after login
- [x] File: `integration_test/sign_in_test.dart`
- [x] Navigates to HomeScreen after successful login

### ✅ Task 9: Performance Profiling & Optimization (10 points)
- [x] Performance demo with heavy operations
- [x] Instructions for recording performance trace
- [x] Identify expensive operations (e.g., heavy builds, synchronous functions)
- [x] Optimize code and provide before/after comparison guidance
- [x] File: `lib/main.dart` (PerformanceDemoScreen)

### ✅ Task 10: Cross-Device Layout Testing (8 points)
- [x] Responsive layout for different screen sizes
- [x] Small phone, large phone, tablet portrait, tablet landscape layouts
- [x] Layout adjustments using Flex, Expanded, LayoutBuilder
- [x] File: `lib/responsive_layout.dart`
- [x] Instructions for testing on different devices

## Total: 100 points

All tasks are fully implemented and ready for testing!

