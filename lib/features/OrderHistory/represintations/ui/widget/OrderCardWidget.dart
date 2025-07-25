import 'package:flutter/material.dart';

import 'OrderInfoRow.dart';
import 'OrderStepper.dart';


class OrderCard extends StatelessWidget {
  final String orderNo;
  final String status;
  final String date;
  final String address;
  final bool isCompleted;

  const OrderCard({
    super.key,
    required this.orderNo,
    required this.status,
    required this.date,
    required this.address,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFEFEFEF)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OrderInfoRow(label: "Order No.", value: "#$orderNo"),
          OrderInfoRow(label: "Status", value: status),
          OrderInfoRow(label: "Date", value: date),
          OrderInfoRow(label: "Address", value: address, isBold: true),
          const SizedBox(height: 12),
          OrderStepper(isCompleted: isCompleted),
        ],
      ),
    );
  }
}
