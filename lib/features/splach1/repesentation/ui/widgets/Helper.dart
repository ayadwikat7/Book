import 'package:flutter/material.dart';

class NavigationHelper {
  static void navigateWithDelay({
    required BuildContext context,
    required Widget destination,
    Duration delay = const Duration(seconds: 3),
  }) {
    Future.delayed(delay, () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => destination),
      );
    });
  }

  static void push({
    required BuildContext context,
    required Widget destination,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  static void pushReplacement({
    required BuildContext context,
    required Widget destination,
  }) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => destination),
    );
  }

  static void pushAndRemoveUntil({
    required BuildContext context,
    required Widget destination,
  }) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => destination),
          (route) => false,
    );
  }
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

}
