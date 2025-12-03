// Task 5: Fixed Buggy Code - Solution

import 'package:flutter/material.dart';

class BuggyCodeScreenFixed extends StatefulWidget {
  const BuggyCodeScreenFixed({super.key});

  @override
  State<BuggyCodeScreenFixed> createState() => _BuggyCodeScreenFixedState();
}

class _BuggyCodeScreenFixedState extends State<BuggyCodeScreenFixed> {
  String? _userName;
  List<String>? _items;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    
    // FIX: Use proper null safety handling
    setState(() {
      _userName = 'John Doe';
      _items = ['Item 1', 'Item 2', 'Item 3'];
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Debugging Exercise - Fixed'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // FIX: Use null-aware operator and provide default value
            Text(
              'Welcome, ${_userName ?? 'Guest'}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Items:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // FIX: Handle null case properly
            Expanded(
              child: _items == null || _items!.isEmpty
                  ? const Center(child: Text('No items available'))
                  : ListView.builder(
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

