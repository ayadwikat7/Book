import 'package:flutter/material.dart';
import '../../../../Book/represintations/widget/Bookdetails.dart';
import '../../../../Home/Data/book_data.dart';
import '../../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../../Home/representations/widget/FlashSaleSection.dart';
import '../../../Data/onItemTapped.dart';
import 'custom_pagination.dart';

class Flashsalebook extends StatefulWidget {
  const Flashsalebook({super.key});

  @override
  State<Flashsalebook> createState() => _FlashsalebookState();
}

class _FlashsalebookState extends State<Flashsalebook> {
  int currentPage = 0;
  static const int itemsPerPage = 5;
  int selectedIndex = 5;

  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > recommendedBooks.length
        ? recommendedBooks.length
        : endIndex;
    final currentBooks = recommendedBooks.sublist(startIndex, endIndex);

    int totalPages = (recommendedBooks.length / itemsPerPage).ceil();

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text('Flash Sale'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // عرض جميع الكتب
          ...currentBooks.map((book) =>
              FlashSaleSection.flashBookItem(context, book)),
          const SizedBox(height: 16),
          // ✅ شريط الصفحات داخل الشاشة أسفل الكتب
          Center(
            child: CustomPagination(
              currentPage: currentPage,
              totalPages: totalPages,
              onPageChanged: (newPage) {
                setState(() {
                  currentPage = newPage;
                });
              },
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
