import 'package:flutter/material.dart';
import 'package:news_app/core/injection/injection_container.dart';
import 'package:news_app/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'News App',
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
