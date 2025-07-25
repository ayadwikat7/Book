import 'package:flutter/material.dart';
import '../../../FlashSaleBook/Data/onItemTapped.dart';
import '../../../FlashSaleBook/represinatons/ui/widght/custom_pagination.dart';
import '../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../createAccount/Repesentation/ui/widget/PinkLoadingIndicator.dart';
import '../../../splach1/repesentation/ui/widgets/Helper.dart';
import 'BookDetails.dart';
import 'buildBookCard.dart';
import 'buildFilterButton.dart';
import '../../../Home/representations/widget/searchText.dart';
import '../../../splach1/Data/color.dart';
import '../../../MyCartPage/data/cart_controller.dart';
import '../../../Home/Data/book_service.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  int selectedIndex = 1;
  int currentPage = 0;
  static const int itemsPerPage = 6;

  final CartController cartController = CartController();
  final BookService _bookService = BookService();

  List<Map<String, dynamic>> allBooks = [];
  List<Map<String, dynamic>> filteredBooks = [];

  bool isLoading = true;
  String currentSort = 'Default';
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _fetchBooks();
  }

  Future<void> _fetchBooks() async {
    try {
      final data = await _bookService.getRecommendedBooks();
      setState(() {
        allBooks = data;
        filteredBooks = List.from(allBooks);
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      print("Error fetching books: $e");
    }
  }

  // البحث
  void _searchBooks(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredBooks = allBooks.where((book) {
        final title = (book['title'] ?? '').toLowerCase();
        final author = (book['author'] ?? '').toLowerCase();
        return title.contains(searchQuery) || author.contains(searchQuery);
      }).toList();
      _applySort(); // إعادة الترتيب بعد البحث
    });
  }

  // الترتيب
  void _applySort() {
    setState(() {
      if (currentSort == 'PriceAsc') {
        filteredBooks.sort((a, b) => (a['price'] as num).compareTo(b['price'] as num));
      } else if (currentSort == 'PriceDesc') {
        filteredBooks.sort((a, b) => (b['price'] as num).compareTo(a['price'] as num));
      } else if (currentSort == 'Rating') {
        filteredBooks.sort((a, b) => (b['rating'] as num).compareTo(a['rating'] as num));
      }
    });
  }

  void _sortBooks(String sortKey) {
    setState(() {
      currentSort = sortKey;
      _applySort();
    });
  }

  // الفلترة (حسب شروطك)
  void _filterBooks() {
    // يمكنك إضافة لوجيك للفلترة هنا
    // حالياً فقط سأعيد ضبط القائمة على الأصلية
    setState(() {
      filteredBooks = List.from(allBooks);
      _applySort();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: PinkLoadingIndicator()),
      );
    }

    // حساب الكتب المعروضة بعد البحث والترتيب
    int startIndex = currentPage * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > filteredBooks.length ? filteredBooks.length : endIndex;
    final currentBooks = filteredBooks.sublist(startIndex, endIndex);
    int totalPages = (filteredBooks.length / itemsPerPage).ceil();

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Appcolor.packGround,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Appcolor.Black),
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              'Books',
              style: TextStyle(
                color: Appcolor.Black,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 8),
            // مربع البحث
            Searchtext(
              onSearch: _searchBooks,
            ),
            const SizedBox(height: 12),
            // أزرار الفلترة والترتيب
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildFilterButton(
                  icon: Icons.filter_list,
                  label: 'Filter',
                  onTap: _filterBooks,
                ),
                BuildFilterButton(
                  icon: Icons.sort,
                  label: 'Sort by',
                  onTap: () {
                    // نافذة اختيار الترتيب
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: const Text('Price: Low to High'),
                              onTap: () {
                                _sortBooks('PriceAsc');
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Price: High to Low'),
                              onTap: () {
                                _sortBooks('PriceDesc');
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Top Rated'),
                              onTap: () {
                                _sortBooks('Rating');
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: const Text('Default'),
                              onTap: () {
                                _sortBooks('Default');
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),

            // شبكة الكتب
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: currentBooks.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 16,
                childAspectRatio: 0.55,
              ),
              itemBuilder: (context, index) {
                final book = currentBooks[index];
                return GestureDetector(
                  onTap: () {
                    NavigationHelper.push(
                      context: context,
                      destination: BookDetailsPage(bookId: book['id']),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      BookCard(
                        image: book['image'],
                        title: book['title'],
                        author: book['author'],
                        price: (book['price'] as num).toDouble(),
                        rating: (book['rating'] as num).toDouble(),
                        reviews: book['reviews'],
                      ),
                    ],
                  ),
                );
              },
            ),
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
            const SizedBox(height: 20),
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
}
