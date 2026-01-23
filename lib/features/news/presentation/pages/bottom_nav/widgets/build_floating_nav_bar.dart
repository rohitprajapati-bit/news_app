import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news_app/features/news/presentation/pages/bottom_nav/widgets/build_nav_item.dart';

Widget buildFloatingNavBar({
  required BuildContext context,
  required int currentIndex,
  required Function(int) onTap,
}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 70, // Slightly taller for premium feel
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.9), // Glassy effect
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildNavItem(
                context: context,
                index: 0,
                currentIndex: currentIndex,
                startIcon: Icons.home_outlined,
                activeIcon: Icons.home_rounded,
                label: 'Home',
                onTap: () => onTap(0),
              ),
              buildNavItem(
                context: context,
                index: 1,
                currentIndex: currentIndex,
                startIcon: Icons.favorite_border_rounded,
                activeIcon: Icons.favorite_rounded,
                label: 'Favorites',
                onTap: () => onTap(1),
              ),
              buildNavItem(
                context: context,
                index: 2,
                currentIndex: currentIndex,
                startIcon: Icons.settings_outlined,
                activeIcon: Icons.settings_rounded,
                label: 'Settings',
                onTap: () => onTap(2),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
