import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFBDCBFF), Color(0xFFFCF6FF)],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: child,
    );
  }
}
