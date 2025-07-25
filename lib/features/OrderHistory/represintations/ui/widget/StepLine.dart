import 'package:flutter/material.dart';

class StepLine extends StatelessWidget {
  final bool active;
  final double lineWidth;

  const StepLine({
    super.key,
    required this.active,
    this.lineWidth = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: lineWidth,
      height: 2,
      color: active ? Colors.pink : Colors.grey.shade400,
    );
  }
}
