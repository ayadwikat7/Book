import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';

class NavigatorButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;

  const NavigatorButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconColor = Colors.grey,
    this.backgroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor ?? Appcolor.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? Appcolor.white,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: iconColor, size: 18),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        splashRadius: 22,
      ),
    );
  }
}
