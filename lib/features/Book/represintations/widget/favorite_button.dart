import 'package:books/features/Book/represintations/widget/toggle_favorite.dart';
import 'package:flutter/material.dart';
import '../../../Wishlist/data/wishlist_data.dart';

class FavoriteButton extends StatefulWidget {
  final String image;
  final String title;
  final String author;
  final double price;

  // Customizable colors
  final Color activeColor;
  final Color inactiveColor;
  final Color backgroundColor;

  const FavoriteButton({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.price,
    this.activeColor = Colors.pink,
    this.inactiveColor = Colors.black,
    this.backgroundColor = Colors.white,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleFavorite(
          context: context,
          image: widget.image,
          title: widget.title,
          author: widget.author,
          price: widget.price,
        );
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isFavorite ? widget.activeColor : widget.inactiveColor,
            width: 1,
          ),
        ),
        child: Icon(
          Icons.favorite_border_outlined,
          color: isFavorite ? widget.activeColor : widget.inactiveColor,
          size: 18,
        ),
      ),
    );
  }
}
