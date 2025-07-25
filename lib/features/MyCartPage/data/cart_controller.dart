import 'package:flutter/foundation.dart';

class CartController extends ChangeNotifier {
  // Singleton instance
  static final CartController _instance = CartController._internal();

  factory CartController() => _instance;
  CartController._internal();

  final List<Map<String, dynamic>> cartItems = [];

  int get totalItems => cartItems.fold(0, (sum, item) => sum + (item['quantity'] as int));

  void addToCart(Map<String, dynamic> item) {
    // إذا لم يكن هناك ID، ننشئ ID جديد
    if (item['id'] == null) {
      item['id'] = DateTime.now().millisecondsSinceEpoch;
    }

    final existingIndex = cartItems.indexWhere((book) => book['id'] == item['id']);
    if (existingIndex >= 0) {
      cartItems[existingIndex]['quantity'] += item['quantity'];
    } else {
      cartItems.add(Map<String, dynamic>.from(item));
    }
    notifyListeners();

    if (kDebugMode) print('Cart Items: $cartItems');
  }

  void removeFromCart(Map<String, dynamic> item) {
    cartItems.removeWhere((book) => book['id'] == item['id']);
    notifyListeners();
  }

  void incrementItem(Map<String, dynamic> item) {
    final index = cartItems.indexWhere((book) => book['id'] == item['id']);
    if (index >= 0) {
      cartItems[index]['quantity']++;
      notifyListeners();
    }
  }

  void decrementItem(Map<String, dynamic> item) {
    final index = cartItems.indexWhere((book) => book['id'] == item['id']);
    if (index >= 0 && cartItems[index]['quantity'] > 1) {
      cartItems[index]['quantity']--;
      notifyListeners();
    }
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }
}
