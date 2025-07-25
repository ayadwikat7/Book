import 'package:flutter/material.dart';
import '../../../Book/represintations/widget/BookDetails.dart';
import '../../../FlashSaleBook/Data/onItemTapped.dart';
import '../../../createAccount/Repesentation/ui/widget/PinkLoadingIndicator.dart';
import '../../../splach1/Data/color.dart';
import '../../../splach1/repesentation/ui/widgets/Helper.dart';
import '../../Data/book_service.dart';
import 'AppBareWithSearch.dart';
import 'CustomBottomNavBar.dart';
import 'FlashSaleSection.dart';
import 'Navigator.dart';
import 'RecommendedSection.dart';

class Booksh extends StatefulWidget {
  const Booksh({super.key});

  @override
  State<Booksh> createState() => _BookshState();
}

int selectedIndex = 0;

class _BookshState extends State<Booksh> {
  final ScrollController _scrollController = ScrollController();
  final BookService _bookService = BookService();

  List<Map<String, dynamic>> bestSellerBooks = [];
  List<Map<String, dynamic>> recommendedBooks = [];
  List<Map<String, dynamic>> flashSaleBooks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    try {
      final bestSellers = await _bookService.getBestSellerBooks();
      final recommended = await _bookService.getRecommendedBooks();
      final flashSales = await _bookService.getFlashSaleBooks();

      setState(() {
        bestSellerBooks = bestSellers;
        recommendedBooks = recommended;
        flashSaleBooks = flashSales;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching books: $e");
      setState(() => isLoading = false);
    }
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 150,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 150,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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

    final recommendedList = recommendedBooks.take(3).toList();

    return Scaffold(

      extendBody: true,
      appBar: Appbarewithsearch(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 90),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Text(
                'Best seller',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: bestSellerBooks.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final book = bestSellerBooks[index];
                  return _bookCover(book);
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavigatorButton(icon: Icons.arrow_back_ios, onPressed: _scrollLeft),
                const SizedBox(width: 12),
                NavigatorButton(icon: Icons.arrow_forward_ios, onPressed: _scrollRight),
              ],
            ),
            const SizedBox(height: 24),
            RecommendedSection(books: recommendedList.take(4).toList()),
            const SizedBox(height: 24),
            FlashSaleSection(books: flashSaleBooks.take(4).toList()),

          ],
        ),
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

  Widget _bookCover(Map<String, dynamic> book) {
    return GestureDetector(
      onTap: () {
        NavigationHelper.push(
          context: context,
          destination: BookDetailsPage(bookId: book['id'] ?? 0), // التأكد من id
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          book['image'] ?? '',
          width: 110,
          height: 160,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 110,
              height: 160,
              color: Colors.grey.shade200,
              child: const Icon(Icons.broken_image_outlined, size: 40, color: Colors.grey),
            );
          },
        ),
      ),
    );
  }

}
