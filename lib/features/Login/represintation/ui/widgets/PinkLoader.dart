import 'package:flutter/material.dart';

class PinkLoader extends StatelessWidget {
  const PinkLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.pink, // لون المؤشر
        strokeWidth: 5,     // سماكة الدائرة
      ),
    );
  }
}
