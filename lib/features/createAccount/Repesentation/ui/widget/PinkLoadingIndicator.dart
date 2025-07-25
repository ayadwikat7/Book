import 'package:flutter/material.dart';
import 'dart:math';

class PinkLoadingIndicator extends StatefulWidget {
  const PinkLoadingIndicator({super.key});

  @override
  State<PinkLoadingIndicator> createState() => _PinkLoadingIndicatorState();
}

class _PinkLoadingIndicatorState extends State<PinkLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: child,
          );
        },
        child: CustomPaint(
          painter: _LoadingDotsPainter(),
        ),
      ),
    );
  }
}

class _LoadingDotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const pink = Color(0xFFE91E63);
    final paint = Paint()..color = pink;
    const int dots = 8;
    final radius = size.width / 2;
    final dotRadius = size.width * 0.1;

    for (int i = 0; i < dots; i++) {
      final angle = (2 * pi / dots) * i;
      final x = radius + (radius - dotRadius) * cos(angle);
      final y = radius + (radius - dotRadius) * sin(angle);
      canvas.drawCircle(Offset(x, y), dotRadius, paint);
      paint.color = pink.withOpacity((dots - i) / dots);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
