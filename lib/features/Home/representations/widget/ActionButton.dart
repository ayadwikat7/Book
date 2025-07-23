import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';

class ActionButton extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final VoidCallback onTap;

  // ألوان قابلة للتخصيص
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;
  final double size;

  const ActionButton({
    super.key,
    required this.isActive,
    required this.icon,
    required this.onTap,
    this.activeColor = Colors.pink,      // اللون عند التفعيل
    this.inactiveColor = Colors.pink,    // اللون عند عدم التفعيل
    this.backgroundColor = Colors.white, // لون الخلفية
    this.size = 36,                      // حجم المربع
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isActive ? activeColor : backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: activeColor,
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          size: size * 0.5,
          color: isActive ? Colors.white : inactiveColor,
        ),
      ),
    );
  }
}
