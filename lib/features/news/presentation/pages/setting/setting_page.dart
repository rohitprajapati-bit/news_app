import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/app_background.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBDCBFF),
        title: const Text('Settings'),
      ),
      body: AppBackground(child: const Center(child: Text('Settings Page'))),
    );
  }
}
