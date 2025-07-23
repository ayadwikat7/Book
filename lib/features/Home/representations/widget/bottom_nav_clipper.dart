import 'package:flutter/material.dart';

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double notchWidth = 70;
    const double notchDepth = 25;
    final double notchCenterX = size.width / 2;
    final double notchLeft = notchCenterX - notchWidth / 2;
    final double notchRight = notchCenterX + notchWidth / 2;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(notchLeft, 0)
      ..quadraticBezierTo(notchCenterX, -notchDepth, notchRight, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
