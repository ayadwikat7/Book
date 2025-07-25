import 'package:flutter/material.dart';

class OrderItemCard extends StatelessWidget {
  final String orderNumber;
  final String status;
  final String date;
  final String address;
  final VoidCallback onDelete;
  final VoidCallback onViewDetail;

  const OrderItemCard({
    super.key,
    required this.orderNumber,
    required this.status,
    required this.date,
    required this.address,
    required this.onDelete,
    required this.onViewDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.pink.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// الصف الأول: أيقونة الحذف على اليمين
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(), // لإبقاء النصوص أسفل
              IconButton(
                onPressed: onDelete,
                icon: const Icon(Icons.delete, color: Colors.pink),
                tooltip: "Delete Order",
              ),
            ],
          ),

          /// معلومات الطلب
          _buildInfoRow("Order No.", "#$orderNumber"),
          _buildInfoRow("Status", status),
          _buildInfoRow("Date", date),
          _buildInfoRow("Address", address, isBold: true),
          const SizedBox(height: 12),

          /// زر عرض التفاصيل
          GestureDetector(
            onTap: onViewDetail,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "View order detail",
                  style: TextStyle(
                    color: Colors.pink[400],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Icon(Icons.arrow_right_alt, color: Colors.pink),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// ويدجت صغيرة لبناء صف (label - value)
  Widget _buildInfoRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey[600]),
          ),
          Flexible(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
