import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';

class BookCard extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final double price;
  final double rating;
  final int reviews;

  const BookCard({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.price,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Appcolor.packGround,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    image,
                    width: 500,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.pink,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
            Text(
              "Author: $author",
              style: const TextStyle(fontSize: 10, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                ...List.generate(
                  rating.floor(),
                      (index) => const Icon(Icons.star, size: 10, color: Colors.amber),
                ),
                if (rating - rating.floor() > 0)
                  const Icon(Icons.star_half, size: 10, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  "($reviews Reviews)",
                  style: const TextStyle(fontSize: 8),
                )
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$${price.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const Icon(
                  Icons.shopping_cart,
                  color: Colors.pink,
                  size: 20,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
