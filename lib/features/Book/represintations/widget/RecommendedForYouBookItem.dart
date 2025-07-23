import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';

class Recommendedforyoubookitem extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final double oldPrice;
  final double newPrice;
  final double rating;
  final int booksLeft;
  final VoidCallback onCartPressed;

  const Recommendedforyoubookitem({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.oldPrice,
    required this.newPrice,
    required this.rating,
    required this.booksLeft,
    required this.onCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      padding: const EdgeInsets.all(12),
      width: 300, // نفس عرض الكرت بالصورة الثانية
      decoration: BoxDecoration(
        color: Appcolor.FlashSaleColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              image,
              width: 80,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "Author: $author",
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 0.7,
                  backgroundColor: Colors.white24,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
                  minHeight: 4,
                ),
                const SizedBox(height: 6),
                Text(
                  "$booksLeft books left",
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.yellow, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$${oldPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                "\$${newPrice.toStringAsFixed(2)}",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: onCartPressed,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
