import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';

class ActionButton extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.isActive,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: isActive ? Appcolor.Pink : Colors.white,
          borderRadius: BorderRadius.circular(8), // ممكن تخليها 18 لو بدك شكل دائري أكثر
          border: Border.all(color: Appcolor.Pink),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isActive ? Colors.white : Appcolor.Pink,
        ),
      ),
    );
  }
}
