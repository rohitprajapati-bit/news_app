import 'package:flutter/material.dart';

Widget buildNavItem({
  required BuildContext context,
  required int index,
  required int currentIndex,
  required IconData startIcon,
  required IconData activeIcon,
  required String label,
  required VoidCallback onTap,
}) {
  final isSelected = currentIndex == index;
  final theme = Theme.of(context);
  final activeColor = theme.primaryColor;

  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: isSelected
          ? BoxDecoration(
              color: activeColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            )
          : BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
            ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, anim) =>
                ScaleTransition(scale: anim, child: child),
            child: Icon(
              isSelected ? activeIcon : startIcon,
              key: ValueKey(isSelected),
              color: isSelected ? activeColor : Colors.grey.shade600,
              size: 26,
            ),
          ),
          if (isSelected) ...[
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: activeColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    ),
  );
}
