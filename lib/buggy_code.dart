// Task 5: Buggy Code for debugging exercise

import 'package:flutter/material.dart';

class BuggyCodeScreen extends StatefulWidget {
  const BuggyCodeScreen({super.key});

  @override
  State<BuggyCodeScreen> createState() => _BuggyCodeScreenState();
}

class _BuggyCodeScreenState extends State<BuggyCodeScreen> {
  String? _userName;
  List<String>? _items;

  @override
  void initState() {
    super.initState();
    // Simulate loading data
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    
    // BUG: This will cause null error if data doesn't load
    setState(() {
      _userName = 'John Doe'; // Simulated data
      _items = ['Item 1', 'Item 2', 'Item 3'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Debugging Exercise'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // BUG: Potential null crash here
            Text(
              'Welcome, ${_userName!}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // BUG: Potential null crash here
            Expanded(
              child: ListView.builder(
                itemCount: _items!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items![index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

