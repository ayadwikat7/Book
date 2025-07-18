import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';
import 'ActionButton.dart';

class RecommendedBookItem extends StatefulWidget {
  final String image;
  final String title;
  final String author;
  final double price;
  final double rating;
  final int reviews;

  const RecommendedBookItem({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.price,
    required this.rating,
    required this.reviews,
  });

  @override
  State<RecommendedBookItem> createState() => _RecommendedBookItemState();
}

class _RecommendedBookItemState extends State<RecommendedBookItem> {
  bool isInCart = true;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.image,
              width: 60,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // العنوان
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Author: ${widget.author}",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4),

                Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Icon(
                        i < widget.rating ? Icons.star : Icons.star_border,
                        size: 14,
                        color: Colors.amber,
                      ),
                    SizedBox(width: 4),
                    Text(
                      "(${widget.reviews} Review)",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.price.toStringAsFixed(2)}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Row(
                      children: [
                        ActionButton(
                          isActive: isInCart,
                          icon: Icons.shopping_cart_outlined,
                          onTap: () {
                            setState(() {
                              isInCart = !isInCart;
                            });
                          },
                        ),
                        SizedBox(width: 8),
                        ActionButton(
                          isActive: isFavorite,
                          icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                          onTap: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
