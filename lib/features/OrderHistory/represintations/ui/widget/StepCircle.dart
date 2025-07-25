import 'package:flutter/material.dart';

class StepCircle extends StatelessWidget {
  final String text;
  final bool active;

  const StepCircle({
    super.key,
    required this.text,
    required this.active,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: active ? Colors.pink : Colors.grey,
          child: const Icon(Icons.check, size: 14, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: TextStyle(
            color: active ? Colors.pink : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
