import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../FlashSaleBook/Data/onItemTapped.dart';
import '../../../FlashSaleBook/represinatons/ui/widght/custom_pagination.dart';
import '../../../Home/representations/widget/BooksH.dart';
import '../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../splach1/repesentation/ui/widgets/Helper.dart';
import 'buildBookCard.dart';
import 'buildFilterButton.dart';
import '../../../Home/representations/widget/searchText.dart';
import '../../../splach1/Data/color.dart';
import '../../../Home/Data/book_data.dart';
import '../../../MyCartPage/data/cart_controller.dart';
import '../../../MyCartPage/reprecentations/widget/MyCartPage.dart';
import '../../../Profile/data/reprecintations/widget/ProfilePage.dart';
import '../../../Book/represintations/widget/Books.dart';
import '../../../Book/represintations/widget/Bookdetails.dart';
import '../../../../main.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  int selectedIndex = 1;
  int currentPage = 0;
  static const int itemsPerPage = 6;

  final CartController cartController = CartController(); // نفس الكائن (Singleton)

  @override
  Widget build(BuildContext context) {
    int startIndex = currentPage * itemsPerPage;
    int endIndex = startIndex + itemsPerPage;
    endIndex = endIndex > recommendedBooks.length ? recommendedBooks.length : endIndex;
    final currentBooks = recommendedBooks.sublist(startIndex, endIndex);

    int totalPages = (recommendedBooks.length / itemsPerPage).ceil();

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
            const Searchtext(),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BuildFilterButton(
                  icon: Icons.filter_list,
                  label: 'Filter',
                  onTap: () {},
                ),
                BuildFilterButton(
                  icon: Icons.sort,
                  label: 'Sort by',
                  onTap: () {},
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
                      destination: Bookdetails(book: book),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      BookCard(
                        image: book['image'],
                        title: book['title'],
                        author: book['author'],
                        price: book['price'],
                        rating: book['rating'],
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
