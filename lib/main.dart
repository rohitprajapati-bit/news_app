import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/injection/injection_container.dart';
import 'package:news_app/core/router/app_router.dart';
import 'package:news_app/features/news/data/models/hive_model/news_hive_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NewsHiveModelAdapter());
  await Hive.openBox<NewsHiveModel>('favorites');
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
