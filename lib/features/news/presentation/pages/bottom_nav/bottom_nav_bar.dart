import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:news_app/features/news/presentation/bloc/bottom_nav/bottom_nav_event.dart';
import 'package:news_app/features/news/presentation/bloc/bottom_nav/bottom_nav_state.dart';
import 'package:news_app/features/news/presentation/pages/bottom_nav/widgets/build_floating_nav_bar.dart';
import 'package:news_app/features/news/presentation/pages/favorites_page.dart';
import 'package:news_app/features/news/presentation/pages/home/home_page.dart';
import 'package:news_app/features/news/presentation/pages/setting_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBloc(),
      child: const _BottomNavBarContent(),
    );
  }
}

class _BottomNavBarContent extends StatelessWidget {
  const _BottomNavBarContent();

  final List<Widget> _pages = const [
    HomePage(),
    FavoritesPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true, // Important for floating nav bar
          body: IndexedStack(index: state.index, children: _pages),
          bottomNavigationBar: buildFloatingNavBar(
            context: context,
            currentIndex: state.index,
            onTap: (index) {
              context.read<BottomNavBloc>().add(BottomNavClickEvent(index));
            },
          ),
        );
      },
    );
  }
}
