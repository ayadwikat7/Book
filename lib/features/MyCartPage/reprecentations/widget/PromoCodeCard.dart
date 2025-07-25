import 'package:flutter/material.dart';
import 'package:books/features/splach1/Data/color.dart';

class PromoCodeCard extends StatelessWidget {
  final TextEditingController promoController;
  final VoidCallback onApply;

  const PromoCodeCard({
    super.key,
    required this.promoController,
    required this.onApply,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              controller: promoController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.card_giftcard_outlined, size: 20),
                hintText: "Enter Promo Code",
                hintStyle: TextStyle(fontSize: 12),
                border: InputBorder.none,
                contentPadding:
                EdgeInsets.symmetric(vertical: 14, horizontal: 8),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: onApply,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            backgroundColor: Appcolor.FlashSaleColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "Apply",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
