import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';
import 'nav_item.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
              child: Container(
                height: 78,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavItem(
                      icon: Icons.home,
                      label: "Home",
                      isSelected: currentIndex == 0,
                      onTap: () => onTap(0),
                    ),
                    NavItem(
                      icon: Icons.menu_book_outlined,
                      label: "Books",
                      isSelected: currentIndex == 1,
                      onTap: () => onTap(1),
                    ),
                    const SizedBox(width: 60), // مساحة للزر العائم
                    NavItem(
                      icon: Icons.shopping_cart_outlined,
                      label: "My Cart",
                      isSelected: currentIndex == 3,
                      onTap: () => onTap(3),
                    ),
                    NavItem(
                      icon: Icons.person,
                      label: "Profile",
                      isSelected: currentIndex == 4,
                      onTap: () => onTap(4),
                      isAvatar: true,
                    ),
                  ],
                ),
              ),
            ),

            // زر البحث العائم
            Positioned(
              top: -25,
              child: GestureDetector(
                onTap: () => onTap(2),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Appcolor.Pink,
                    boxShadow: [
                      BoxShadow(
                        color: Appcolor.Pink.withOpacity(0.3),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.search, color: Colors.white, size: 30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
