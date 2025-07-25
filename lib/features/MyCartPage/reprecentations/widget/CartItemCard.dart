import 'package:books/features/splach1/Data/color.dart';
import 'package:flutter/material.dart';
import 'CartActionButton.dart';

class CartItemCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String asin;
  final double price;
  final int quantity;
  final VoidCallback onRemove;
  final VoidCallback onMoveToWishlist;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItemCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.asin,
    required this.price,
    required this.quantity,
    required this.onRemove,
    required this.onMoveToWishlist,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero, // إزالة أي مسافة خارجية
      padding: const EdgeInsets.all(6),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                child: Image.network(
                  imageUrl,
                  width: 60,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Author: $author',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ASIN: $asin',
                      style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4), // تقليل المسافة هنا
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CartActionButton(
                    label: "Remove",
                    icon: Icons.delete_outline,
                    onTap: onRemove,
                  ),
                  const SizedBox(width: 8),
                  CartActionButton(
                    label: "Move to wishlist",
                    icon: Icons.favorite_border,
                    onTap: onMoveToWishlist,
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: onDecrement,
                    color: Appcolor.Pink,
                  ),
                  Text(
                    '$quantity',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline),
                    onPressed: onIncrement,
                    color: Appcolor.Pink,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
