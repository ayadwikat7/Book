import 'package:flutter/material.dart';
import '../../../FlashSaleBook/Data/onItemTapped.dart';
import '../../../checkOut/represenation/ui/widgt/CheckOut.dart';
import '../../data/cart_controller.dart';
import '../../../Home/representations/widget/CustomBottomNavBar.dart';
import 'CartItemCard.dart';
import 'CheckoutBar.dart';
import 'PriceSummaryCard.dart';
import 'PromoCodeCard.dart';

class Mycartpage extends StatefulWidget {
  const Mycartpage({super.key});

  @override
  State<Mycartpage> createState() => _MycartpageState();
}

class _MycartpageState extends State<Mycartpage> {
  final CartController controller = CartController(); // Singleton
  final TextEditingController promoController = TextEditingController();

  double get totalPrice =>
      controller.cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text("My Cart"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // قائمة الكتب
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.cartItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 0),
                  itemBuilder: (context, index) {
                    final book = controller.cartItems[index];
                    return CartItemCard(
                      imageUrl: book['image'],
                      title: book['title'],
                      author: book['author'],
                      asin: book['asin'] ?? '',
                      price: book['price'],
                      quantity: book['quantity'],
                      onRemove: () => controller.removeFromCart(book),
                      onMoveToWishlist: () {},
                      onIncrement: () => controller.incrementItem(book),
                      onDecrement: () => controller.decrementItem(book),
                    );
                  },
                ),

                // ملخص السعر
                PriceSummaryCard(
                  subtotal: totalPrice,
                  shipping: "Free Delivery",
                  tax: 4,
                  total: totalPrice + 4,
                ),

                // كود الخصم
                PromoCodeCard(
                  promoController: promoController,
                  onApply: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Promo code applied")),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return CheckoutBar(
                itemCount: controller.totalItems,
                totalPrice: totalPrice,
                onCheckout: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Checkout(), // صفحة Checkout
                    ),
                  );
                },
              );
            },
          ),

          CustomBottomNavBar(
            currentIndex: 3,
            onTap: (index) {
              BottomNavHandler.onItemTapped(
                context: context,
                index: index,
                currentIndex: 3,
                updateIndex: (newIndex) {
                  setState(() {});
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
