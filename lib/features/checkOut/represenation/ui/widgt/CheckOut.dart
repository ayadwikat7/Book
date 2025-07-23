import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../FlashSaleBook/Data/onItemTapped.dart';
import '../../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../../MyCartPage/data/cart_controller.dart';
import '../../../../MyCartPage/reprecentations/widget/CartItemCard.dart';
import '../../../../MyCartPage/reprecentations/widget/PriceSummaryCard.dart';
import '../../../../MyCartPage/reprecentations/widget/PromoCodeCard.dart';

import 'ConfirmAddressCard.dart';
import 'PaymentMethodCard.dart';
import 'AddNoteCard.dart';
import 'ConfirmOrderButton.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final CartController controller = CartController();
  final TextEditingController promoController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String? selectedAddress;

  double get totalPrice =>
      controller.cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Check out"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.cartItems.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
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
                const SizedBox(height: 12),
                PriceSummaryCard(
                  subtotal: totalPrice,
                  shipping: "Free Delivery",
                  tax: 4,
                  total: totalPrice + 4,
                ),
                const SizedBox(height: 12),
                PromoCodeCard(
                  promoController: promoController,
                  onApply: () {
                    // هنا كان يوجد SnackBar، أزلناه
                  },
                ),
                const SizedBox(height: 12),
                ConfirmAddressCard(
                  onLocationPicked: (String address) {
                    setState(() {
                      selectedAddress = address;
                    });
                    // أزلنا SnackBar هنا
                  },
                ),
                if (selectedAddress != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Address: $selectedAddress",
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                const SizedBox(height: 12),
                const PaymentMethodCard(),
                const SizedBox(height: 12),
                AddNoteCard(noteController: noteController),
                const SizedBox(height: 20),
                ConfirmOrderButton(
                  onConfirm: () {
                    // أزلنا SnackBar هنا
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
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
    );
  }
}
