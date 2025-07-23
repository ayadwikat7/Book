import 'package:flutter/material.dart';
import 'package:books/features/splach1/Data/color.dart';

class PriceSummaryCard extends StatelessWidget {
  final double subtotal;
  final double tax;
  final String shipping;
  final double total;

  const PriceSummaryCard({
    super.key,
    required this.subtotal,
    required this.tax,
    required this.shipping,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero, // إزالة أي مسافة خارجية
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // تقليل الـ padding
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4, // تقليل الظل
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildRow("Subtotal", "\$${subtotal.toStringAsFixed(0)}"),
          _buildRow("Shipping", shipping, boldRight: true),
          _buildRow("Tax", "\$${tax.toStringAsFixed(0)}"),
          const Divider(height: 12, thickness: 1), // تقليل ارتفاع الـ Divider
          _buildRow(
            "Total",
            "\$${total.toStringAsFixed(0)}",
            boldLeft: true,
            boldRight: true,
            colorRight: Colors.pink,
          ),
        ],
      ),
    );
  }

  Widget _buildRow(String left, String right,
      {bool boldLeft = false, bool boldRight = false, Color? colorRight}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2), // تقليل المسافة بين الأسطر
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: boldLeft ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            right,
            style: TextStyle(
              fontSize: 14,
              fontWeight: boldRight ? FontWeight.bold : FontWeight.normal,
              color: colorRight ?? Appcolor.FlashSaleColor,
            ),
          ),
        ],
      ),
    );
  }
}
