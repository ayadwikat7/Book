import 'package:books/features/splach1/Data/color.dart';
import 'package:flutter/material.dart';

class CartActionButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback onTap;

  const CartActionButton({
    super.key,
    required this.label,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: icon != null
          ? Icon(icon, size: 14, color: Appcolor.BorderSearch)
          : const SizedBox.shrink(),
      label: Text(
        label,
        style: const TextStyle(fontSize: 10, color: Appcolor.BorderSearch),
      ),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        side: BorderSide(color: Appcolor.BorderSearch),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),

        ),
      ),
    );
  }
}
