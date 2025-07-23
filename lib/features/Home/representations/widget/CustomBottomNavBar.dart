import 'package:flutter/material.dart';

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
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ClipPath(
          clipper: BottomNavClipper(),
          child: Container(
            height: 78, // ارتفاع الشريط
            color: Colors.white,
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(Icons.home, "Home", 0),
                _buildNavItem(Icons.menu_book, "Books", 1),
                const SizedBox(width: 60), // مكان الزر الوسط
                _buildNavItem(Icons.shopping_cart, "My Cart", 3),
                _buildNavItem(Icons.person, "Profile", 4),
              ],
            ),
          ),
        ),

        // زر البحث في المنتصف
        Positioned(
          bottom: 30, // نصف الزر خارج الشريط
          child: GestureDetector(
            onTap: () => onTap(4),
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 3,
                    offset: Offset(0, 10),
                  )
                ],
              ),
              child: Icon(Icons.search, color: Colors.black87, size: 24),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? Colors.black : Colors.grey,
            size: 22,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double center = size.width / 2;
    double curveRadius = 45 ; // نصف ارتفاع الزر + عمق إضافي (24 + 12 = 36)

    final path = Path();
    path.lineTo(center - curveRadius - 25, 0);
    path.quadraticBezierTo(center - curveRadius - 10, 0, center - curveRadius, 15);

    path.arcToPoint(
      Offset(center + curveRadius, 15),
      radius: Radius.circular(curveRadius),
      clockwise: false,
    );

    path.quadraticBezierTo(center + curveRadius + 10, 0, center + curveRadius + 25, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
