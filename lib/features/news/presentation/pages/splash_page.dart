import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/core/router/app_routes.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      context.go(AppRoutes.bottomNavBar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF000000), Color(0xFF1E4BFF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 420,
              left: 100,
              child: SvgPicture.asset(
                'assets/svg_images/Subtract-1.svg',
                width: 20,
              ),
            ),

            Positioned(
              bottom: 490,
              right: 100,
              child: SvgPicture.asset(
                'assets/svg_images/Subtract.svg',
                width: 20,
              ),
            ),

            Center(child: Image.asset('assets/png_images/ShouT.png')),
          ],
        ),
      ),
    );
  }
}
