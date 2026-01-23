import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final dynamic news;
  const DetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(child: Text('Detail Page')),
    );
  }
}
