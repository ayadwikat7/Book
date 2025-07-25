import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';

class AddToCartBar extends StatefulWidget {
  final int initialQuantity;
  final Function(int quantity) onAddToCart;

  const AddToCartBar({
    super.key,
    required this.onAddToCart,
    this.initialQuantity = 1,
  });

  @override
  State<AddToCartBar> createState() => _AddToCartBarState();
}

class _AddToCartBarState extends State<AddToCartBar> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 1) quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Appcolor.Pink,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // التحكم بالكمية
            Container(
              width: 90,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: _decreaseQuantity,
                    child: Icon(Icons.remove, color: Appcolor.Pink, size: 18),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.Pink,
                    ),
                  ),
                  GestureDetector(
                    onTap: _increaseQuantity,
                    child: Icon(Icons.add, color: Appcolor.Pink, size: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: GestureDetector(
                onTap: () => widget.onAddToCart(quantity),
                child: Container(
                  height: 32,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Appcolor.Pink,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Add to cart",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
