import 'package:flutter/material.dart';

class PaymentMethodCard extends StatefulWidget {
  const PaymentMethodCard({super.key});

  @override
  State<PaymentMethodCard> createState() => _PaymentMethodCardState();
}

class _PaymentMethodCardState extends State<PaymentMethodCard> {
  String selectedMethod = 'Cash on delivery';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Payment Method",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          RadioListTile<String>(
            title: const Text("Online payment"),
            value: 'Online payment',
            groupValue: selectedMethod,
            onChanged: (value) => setState(() => selectedMethod = value!),
          ),
          RadioListTile<String>(
            title: const Text("Cash on delivery"),
            value: 'Cash on delivery',
            groupValue: selectedMethod,
            onChanged: (value) => setState(() => selectedMethod = value!),
          ),
          RadioListTile<String>(
            title: const Text("POS on delivery"),
            value: 'POS on delivery',
            groupValue: selectedMethod,
            onChanged: (value) => setState(() => selectedMethod = value!),
          ),
        ],
      ),
    );
  }
}
