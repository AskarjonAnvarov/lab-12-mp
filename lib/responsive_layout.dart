// Task 10: Cross-Device Layout Testing

import 'package:flutter/material.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  const ResponsiveLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layout'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Determine layout based on screen width
          if (constraints.maxWidth < 600) {
            // Small phone: Single column
            return _buildPhoneLayout();
          } else if (constraints.maxWidth < 900) {
            // Large phone / Tablet portrait: Two columns
            return _buildTabletPortraitLayout();
          } else {
            // Tablet landscape: Three columns
            return _buildTabletLandscapeLayout();
          }
        },
      ),
    );
  }

  Widget _buildPhoneLayout() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildCard('Card 1', Colors.blue),
        _buildCard('Card 2', Colors.green),
        _buildCard('Card 3', Colors.orange),
        _buildCard('Card 4', Colors.purple),
      ],
    );
  }

  Widget _buildTabletPortraitLayout() {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        final colors = [Colors.blue, Colors.green, Colors.orange, Colors.purple];
        return _buildCard('Card ${index + 1}', colors[index]);
      },
    );
  }

  Widget _buildTabletLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildCard('Card 1', Colors.blue),
              _buildCard('Card 2', Colors.green),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildCard('Card 3', Colors.orange),
              _buildCard('Card 4', Colors.purple),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              _buildCard('Card 5', Colors.red),
              _buildCard('Card 6', Colors.teal),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCard(String title, Color color) {
    return Card(
      color: color,
      child: Container(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

