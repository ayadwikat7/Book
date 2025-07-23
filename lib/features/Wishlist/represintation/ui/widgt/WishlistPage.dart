import 'package:flutter/material.dart';
import '../../../../MyCartPage/reprecentations/widget/CartItemCard.dart';
import '../../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../../FlashSaleBook/Data/onItemTapped.dart';
import '../../../data/wishlist_data.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  void _removeItem(int index) {
    setState(() {
      wishlistItems.removeAt(index);
    });
  }

  void _moveToCart(int index) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${wishlistItems[index]['title']} moved to cart')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wishlist'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: wishlistItems.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final book = wishlistItems[index];
          return CartItemCard(
            imageUrl: book['image'],
            title: book['title'],
            author: book['author'],
            asin: book['asin'],
            price: book['price'],
            quantity: book['quantity'],
            onRemove: () => _removeItem(index),
            onMoveToWishlist: () => _moveToCart(index),
            onIncrement: () {
              setState(() => book['quantity']++);
            },
            onDecrement: () {
              if (book['quantity'] > 1) {
                setState(() => book['quantity']--);
              }
            },
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          BottomNavHandler.onItemTapped(
            context: context,
            index: index,
            currentIndex: 1,
            updateIndex: (newIndex) {
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
