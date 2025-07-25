import 'package:flutter/material.dart';
import '../../../Wishlist/data/wishlist_data.dart';

void toggleFavorite({
  required BuildContext context,
  required String image,
  required String title,
  required String author,
  required double price,
}) {
  final existingIndex = wishlistItems.indexWhere((item) => item['title'] == title);

  if (existingIndex == -1) {
    wishlistItems.add({
      'image': image,
      'title': title,
      'author': author,
      'asin': 'N/A',
      'price': price,
      'quantity': 1,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$title added to Wishlist')),
    );
  } else {
    wishlistItems.removeAt(existingIndex);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$title removed from Wishlist')),
    );
  }
}
