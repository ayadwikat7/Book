import 'package:flutter/material.dart';
import '../../../../Book/represintations/widget/Bookdetails.dart';
import '../../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../../Home/representations/widget/FlashSaleSection.dart';
import '../../../../createAccount/Repesentation/ui/widget/PinkLoadingIndicator.dart';
import '../../../Data/onItemTapped.dart';
import '../../../../splach1/Data/color.dart';
import '../../../../Home/Data/book_service.dart';
import 'custom_pagination.dart';
import '../../../../splach1/repesentation/ui/widgets/Helper.dart';

class Flashsalebook extends StatefulWidget {
  const Flashsalebook({super.key});

  @override
  State<Flashsalebook> createState() => _FlashsalebookState();
}

class _FlashsalebookState extends State<Flashsalebook> {
  final BookService _bookService = BookService();
  List<Map<String, dynamic>> flashSaleBooks = [];

  int currentPage = 0;
  static const int itemsPerPage = 4;
  int selectedIndex = 5; 
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFlashSaleBooks();
  }

  Future<void> _fetchFlashSaleBooks() async {
    try {
      final books = await _bookService.getFlashSaleBooks(); // جلب البيانات من API
      setState(() {
        flashSaleBooks = books;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching flash sale books: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(
          child: PinkLoadingIndicator(),
        ),
      );
    }

    if (flashSaleBooks.isEmpty) {
      return const Scaffold(
        body: Center(child: Text("No Flash Sale books available")),
      );
    }

    // تقسيم الكتب حسب الصفحة الحالية
    int startIndex = currentPage * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > flashSaleBooks.length ? flashSaleBooks.length : endIndex;
    final currentBooks = flashSaleBooks.sublist(startIndex, endIndex);

    int totalPages = (flashSaleBooks.length / itemsPerPage).ceil();

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Appcolor.packGround,
        title: const Text('Flash Sale', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // عرض الكتب الحالية (Flash Sale Items)
          ...currentBooks.map((book) {
            return GestureDetector(
              onTap: () {
                NavigationHelper.push(
                  context: context,
                  destination: BookDetailsPage(bookId: book['id']),
                );
              },
              child: FlashSaleSection.flashBookItem(context, book),
            );
          }).toList(),

          const SizedBox(height: 16),

          // شريط الصفحات
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
