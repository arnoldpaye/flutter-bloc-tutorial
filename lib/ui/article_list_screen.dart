import 'package:flutter/material.dart';

class ArticleListScreen extends StatelessWidget {
  const ArticleListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search ...',
              ),
              onChanged: (query) {
                // 2
              },
            ),
          ),
          Expanded(
            // 3
            child: _buildResults(),
          ),
        ],
      ),
    );
  }

  _buildResults() {
    return const Center(child: Text('No Results'));
  }
}
