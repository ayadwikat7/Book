import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';

class BuildFilterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const BuildFilterButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 42,
            decoration: BoxDecoration(
              color: Appcolor.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Appcolor.BorderSearch),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Appcolor.Black,
                      fontSize: 14,
                    ),
                  ),
                  Icon(icon, color: Appcolor.Black, size: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}