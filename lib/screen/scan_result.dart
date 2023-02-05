import 'package:flutter/material.dart';

class ScanResultScreen extends StatelessWidget {
  static const routeName = '/scan-result';
  final String content;

  const ScanResultScreen({
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Text(content),
    );
  }
}
