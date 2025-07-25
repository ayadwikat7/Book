import 'package:flutter/material.dart';

import '../../../../splach1/Data/color.dart';

class OrderFilterTabs extends StatefulWidget {
  final Function(int) onTabSelected;
  final int selectedIndex;

  const OrderFilterTabs({
    super.key,
    required this.onTabSelected,
    required this.selectedIndex,
  });

  @override
  State<OrderFilterTabs> createState() => _OrderFilterTabsState();
}

class _OrderFilterTabsState extends State<OrderFilterTabs> {
  final List<String> tabs = ["All", "In Progress", "Completed", "Cancelled"];

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.circular(5),
          color: Appcolor.TabBackGround,
        ),

        child: SingleChildScrollView(

          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = widget.selectedIndex == index;
              return GestureDetector(
                onTap: () {
                  widget.onTabSelected(index);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: isSelected ? Appcolor.Pink : Appcolor.white,
                    border: Border.all(
                      color: isSelected ? Appcolor.Pink : Appcolor.BorderSearch,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tabs[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Appcolor.TapOrder,

                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
