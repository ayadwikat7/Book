import 'package:flutter/material.dart';

import 'StepCircle.dart';
import 'StepLine.dart';


class OrderStepper extends StatelessWidget {
  final bool isCompleted;

  const OrderStepper({super.key, this.isCompleted = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const StepCircle(text: "Order placed", active: true),
        StepLine(active: true, lineWidth: 50), // هنا طول الخط
        StepCircle(text: "Shipping", active: !isCompleted),
        StepLine(active: isCompleted, lineWidth: 50),
        StepCircle(text: "Completed", active: isCompleted),
      ],
    );
  }
}
