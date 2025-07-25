import 'package:flutter/material.dart';
import '../../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../../FlashSaleBook/Data/onItemTapped.dart';
import 'OrderCardWidget.dart';
import 'OrderFilterTabs.dart';
import 'OrderItemCard.dart';
import 'package:books/features/splach1/Data/color.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  int selectedIndex = 0; // 0 = All, 1 = In Progress, 2 = Completed, 3 = Cancelled

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(

        title: const Text(
          "Order history",
          style: TextStyle(
            color: Appcolor.TapOrder,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(onPressed: (){},
            icon: Icon(Icons.navigate_before)),
        elevation: 0,
        iconTheme: const IconThemeData(color: Appcolor.TapOrder),
      ),
      body: Column(
        children: [
          OrderFilterTabs(
            selectedIndex: selectedIndex,
            onTabSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),

          Expanded(
            child: ListView(
              children: [
                if (selectedIndex == 0) ...[
                  OrderCard(
                    orderNo: "123456",
                    status: "In progress",
                    date: "jul, 31 2024",
                    address: "Maadi, Cairo, Egypt.",
                    isCompleted: false,
                  ),
                  OrderCard(
                    orderNo: "123456",
                    status: "Completed",
                    date: "jul, 31 2024",
                    address: "Maadi, Cairo, Egypt.",
                    isCompleted: true,
                  ),
                  OrderItemCard(
                    orderNumber: '123456',
                    status: 'Completed',
                    date: 'jul, 31 2024',
                    address: 'Maadi, Cairo, Egypt.',
                    onDelete: () {
                      print('Delete pressed');
                    },
                    onViewDetail: () {
                      print('View details pressed');
                    },
                  ),
                ] else if (selectedIndex == 1) ...[
                  /// In Progress
                  OrderCard(
                    orderNo: "123456",
                    status: "In progress",
                    date: "jul, 31 2024",
                    address: "Maadi, Cairo, Egypt.",
                    isCompleted: false,
                  ),
                  OrderCard(
                    orderNo: "123457",
                    status: "In progress",
                    date: "aug, 01 2024",
                    address: "Nasr City, Cairo, Egypt.",
                    isCompleted: false,
                  ),
                ] else if (selectedIndex == 2) ...[
                  /// Completed
                  OrderItemCard(
                    orderNumber: '123456',
                    status: 'Completed',
                    date: 'jul, 31 2024',
                    address: 'Maadi, Cairo, Egypt.',
                    onDelete: () {
                      print('Delete pressed');
                    },
                    onViewDetail: () {
                      print('View details pressed');
                    },
                  ),
                ] else if (selectedIndex == 3) ...[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "No cancelled orders",
                        style: TextStyle(color: Appcolor.TapOrder, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: CustomBottomNavBar(
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
    );
  }
}
