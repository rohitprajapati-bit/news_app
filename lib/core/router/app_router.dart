import 'package:go_router/go_router.dart';
import 'package:news_app/core/router/app_routes.dart';
import 'package:news_app/features/news/presentation/pages/bottom_nav/bottom_nav_bar.dart';
import 'package:news_app/features/news/presentation/pages/detail_page.dart';
import 'package:news_app/features/news/presentation/pages/details_web_page.dart';
import 'package:news_app/features/news/presentation/pages/favorites_page.dart';
import 'package:news_app/features/news/presentation/pages/home/home_page.dart';
import 'package:news_app/features/news/presentation/pages/setting_page.dart';
import 'package:news_app/features/news/presentation/pages/splash_page.dart';

class AppRouter {
  AppRouter._();

  static final router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: _routes(),
  );

  static List<GoRoute> _routes() => [
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (_, _) => const SplashPage(),
    ),

    GoRoute(
      path: AppRoutes.home,
      name: 'home',
      builder: (_, _) => const HomePage(),
    ),

    GoRoute(
      path: AppRoutes.detail,
      name: 'detail',
      builder: (context, state) {
        final news = state.extra as dynamic;
        return DetailPage(news: news);
      },
    ),

    GoRoute(
      path: AppRoutes.detailWeb,
      name: 'detailWeb',
      builder: (context, state) {
        final news = state.extra as dynamic;
        return DetailsWebPage(news: news);
      },
    ),

    GoRoute(
      path: AppRoutes.favorites,
      name: 'favorites',
      builder: (_, _) => const FavoritesPage(),
    ),
    GoRoute(
      path: AppRoutes.settings,
      name: 'settings',
      builder: (_, _) => const SettingPage(),
    ),
    GoRoute(
      path: AppRoutes.bottomNavBar,
      name: 'bottomNavBar',
      builder: (_, _) => const BottomNavBar(),
    ),
  ];
}
