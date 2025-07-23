import 'package:flutter/material.dart';

class WishlistController extends ChangeNotifier {
  final List<Map<String, dynamic>> wishlistItems = [];

  void addToWishlist(Map<String, dynamic> book) {
    wishlistItems.add(book);
    notifyListeners();
  }

  void removeFromWishlist(Map<String, dynamic> book) {
    wishlistItems.remove(book);
    notifyListeners();
  }
}
