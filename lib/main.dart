// Lab 12: Testing & Debugging in Flutter
// Abdusamad Nigmatov
// 220063

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'counter_screen.dart';
import 'buggy_code.dart';
import 'buggy_code_fixed.dart';
import 'responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab 12 - Testing & Debugging',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 12 - Testing & Debugging'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CounterScreen()),
              );
            },
            child: const Text('Task 2: Counter App'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: const Text('Task 3: Login Form'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Task 5: Debugging Exercise'),
                  content: const Text('Choose which version to view:'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BuggyCodeScreen(),
                          ),
                        );
                      },
                      child: const Text('Buggy Code (Crashes)'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BuggyCodeScreenFixed(),
                          ),
                        );
                      },
                      child: const Text('Fixed Code'),
                    ),
                  ],
                ),
              );
            },
            child: const Text('Task 5: Debugging Exercise'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const RebuildDemoScreen(),
                ),
              );
            },
            child: const Text('Task 6: Rebuild Demo'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const PerformanceDemoScreen(),
                ),
              );
            },
            child: const Text('Task 9: Performance Demo'),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ResponsiveLayoutScreen(),
                ),
              );
            },
            child: const Text('Task 10: Responsive Layout'),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// TASK 6: Excessive Rebuilds Demo
// ============================================================================

class RebuildDemoScreen extends StatefulWidget {
  const RebuildDemoScreen({super.key});

  @override
  State<RebuildDemoScreen> createState() => _RebuildDemoScreenState();
}

class _RebuildDemoScreenState extends State<RebuildDemoScreen> {
  int _counter = 0;
  String _message = 'Hello';

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This rebuilds every time, even though _message doesn't change
    debugPrint('RebuildDemoScreen build() called');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rebuild Demo (Task 6)'),
      ),
      body: Column(
        children: [
          // Optimized: Extracted widget with const
          const _OptimizedWidget(message: 'Static Message'),
          
          // This will rebuild unnecessarily
          _UnoptimizedWidget(message: _message, counter: _counter),
          
          Text('Counter: $_counter'),
          ElevatedButton(
            onPressed: _increment,
            child: const Text('Increment'),
          ),
        ],
      ),
    );
  }
}

class _OptimizedWidget extends StatelessWidget {
  final String message;
  
  const _OptimizedWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    debugPrint('_OptimizedWidget build() called');
    return Text(message);
  }
}

class _UnoptimizedWidget extends StatelessWidget {
  final String message;
  final int counter;
  
  const _UnoptimizedWidget({
    required this.message,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('_UnoptimizedWidget build() called');
    return Text('$message - Counter: $counter');
  }
}

// ============================================================================
// TASK 9: Performance Profiling Demo
// ============================================================================

class PerformanceDemoScreen extends StatefulWidget {
  const PerformanceDemoScreen({super.key});

  @override
  State<PerformanceDemoScreen> createState() => _PerformanceDemoScreenState();
}

class _PerformanceDemoScreenState extends State<PerformanceDemoScreen> {
  List<int> _heavyList = [];
  bool _isLoading = false;

  void _generateHeavyList() {
    setState(() {
      _isLoading = true;
    });
    
    // Expensive synchronous operation
    final List<int> list = [];
    for (int i = 0; i < 100000; i++) {
      list.add(i * i);
    }
    
    setState(() {
      _heavyList = list;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Performance Demo (Task 9)'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _isLoading ? null : _generateHeavyList,
            child: _isLoading
                ? const CircularProgressIndicator()
                : const Text('Generate Heavy List'),
          ),
          Expanded(
            child: _heavyList.isEmpty
                ? const Center(child: Text('No data'))
                : ListView.builder(
                    itemCount: _heavyList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Item ${_heavyList[index]}'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

