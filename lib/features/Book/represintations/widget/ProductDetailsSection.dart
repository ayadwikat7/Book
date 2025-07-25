import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';

class BookTabsSection extends StatefulWidget {
  final int initialIndex;
  final Function(int) onTabSelected;

  const BookTabsSection({
    super.key,
    this.initialIndex = 0,
    required this.onTabSelected,
  });

  @override
  State<BookTabsSection> createState() => _BookTabsSectionState();
}

class _BookTabsSectionState extends State<BookTabsSection> {
  int selectedIndex = 0;
  final List<String> tabs = [
    "Product Details",
    "Customer Reviews",
    "Recommended For You",
  ];

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(tabs.length, (index) {
            final bool isActive = selectedIndex == index;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                widget.onTabSelected(index);
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tabs[index],
                      style: TextStyle(
                        color: isActive ? Appcolor.Black : Colors.grey,
                        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      height: 2,
                      width: isActive ? 150 : 0, // عرض المؤشر
                      color: isActive ? Appcolor.Discount : Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
