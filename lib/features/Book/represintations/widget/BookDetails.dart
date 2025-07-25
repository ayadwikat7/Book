import 'package:flutter/material.dart';
import '../../../FlashSaleBook/Data/onItemTapped.dart';
import '../../../Home/Data/book_service.dart';
import '../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../MyCartPage/data/cart_controller.dart';
import '../../../createAccount/Repesentation/ui/widget/PinkLoadingIndicator.dart';
import 'AddToCartBar.dart';
import 'BookDetailsSection.dart';
import 'BookImageSection.dart';
import 'CustomerReviwes.dart';
import 'ProductDetalis.dart';
import 'RecomanededForYou.dart';
import 'ProductDetailsSection.dart'; // BookTabsSection

class BookDetailsPage extends StatefulWidget {
  final int bookId;

  const BookDetailsPage({super.key, required this.bookId});

  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  int selectedIndex = 1;
  final CartController cartController = CartController();
  final BookService _bookService = BookService();
  late Future<Map<String, dynamic>> _bookFuture;

  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    // استدعاء الـ API
    _bookFuture = _bookService.getBookDetails(widget.bookId);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _bookFuture,
      builder: (context, snapshot) {
        // اللودر المخصص أثناء تحميل البيانات
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: PinkLoadingIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text("Error: ${snapshot.error}")),
          );
        } else if (!snapshot.hasData) {
          return const Scaffold(
            body: Center(child: Text("Book not found")),
          );
        }

        final book = snapshot.data!;
        final List<String> images = [
          if (book['image'] != null) book['image'],
          if (book['background_image'] != null) book['background_image'],
        ];

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              "Book details",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // صور الكتاب
                BookImageSection(
                  images: images,
                  onShare: () {},
                  onFavorite: () {},
                ),
                // عنوان + وصف + سعر
                BookDetailsSection(book: book),

                // السعر + حالة التوفر
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [

                          if (book['old_price'] != null)
                            Text(
                              "\$${book['old_price']}",
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                        ],
                      ),
                      if (book['in_stock'] == 1)
                        const Text("In Stock",
                            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold))
                      else
                        const Text("Out of Stock",
                            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                // Tabs (Product Details / Reviews / Recommended)
                BookTabsSection(
                  initialIndex: 0,
                  onTabSelected: (index) {
                    setState(() {
                      _selectedTab = index;
                    });
                  },
                ),
                const SizedBox(height: 8),

                if (_selectedTab == 0)
                  ProductDetailsSection(book: book)
                else if (_selectedTab == 1)
                  const CustomerReviewsSection()
                else
                  const Recomanededforyou(),
              ],
            ),
          ),
          bottomNavigationBar: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AddToCartBar(
                onAddToCart: (quantity) {
                  final bookWithQuantity = {
                    ...book,
                    'quantity': quantity,
                    'id': book['id'] ?? DateTime.now().millisecondsSinceEpoch,
                  };
                  cartController.addToCart(bookWithQuantity);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("${book['title']} added to cart")),
                  );
                },
              ),
              CustomBottomNavBar(
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
            ],
          ),
        );
      },
    );
  }
}
