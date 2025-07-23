import 'package:flutter/material.dart';
import '../../../FlashSaleBook/Data/onItemTapped.dart';
import '../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../MyCartPage/data/cart_controller.dart'; // استدعاء الكنترولر
import 'AddToCartBar.dart';
import 'BookDetailsSection.dart';
import 'BookImageSection.dart';
import 'CustomerReviwes.dart';
import 'ProductDetailsSection.dart';
import 'ProductDetalis.dart';
import 'RecomanededForYou.dart';

class Bookdetails extends StatefulWidget {
  final Map<String, dynamic> book;

  const Bookdetails({super.key, required this.book});

  @override
  State<Bookdetails> createState() => _BookdetailsState();
}

class _BookdetailsState extends State<Bookdetails> {
  int selectedTab = 0;
  int selectedIndex = 1;
  int quantity = 1;

  final CartController cartController = CartController(); // السلة

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Book details",
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookImageSection(
              images: List<String>.from(widget.book['images']),
              onShare: () {},
              onFavorite: () {},
            ),
            BookDetailsSection(book: widget.book),
            IndexedStack(
              index: selectedTab,
              children: [
                ProductDetailsSection(book: widget.book),
                CustomerReviewsSection(),
                Recomanededforyou(),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AddToCartBar(
            onAddToCart: (quantity) {
              final bookWithQuantity = {
                ...widget.book,
                'quantity': quantity,
                // إذا لم يكن هناك ID، نولده هنا
                'id': widget.book['id'] ?? DateTime.now().millisecondsSinceEpoch,
              };
              cartController.addToCart(bookWithQuantity);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${widget.book['title']} added to cart")),
              );
            },
          ),


          CustomBottomNavBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              BottomNavHandler.onItemTapped(
                context: context,
                index: index,
                currentIndex: selectedIndex,
                updateIndex: (newIndex) {
                  setState(() {
                    selectedIndex = newIndex;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
