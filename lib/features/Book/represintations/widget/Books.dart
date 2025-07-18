import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Home/representations/widget/BooksH.dart';
import '../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../splach1/repesentation/ui/widgets/Helper.dart';
import 'buildBookCard.dart';
import 'buildFilterButton.dart';
import '../../../Home/representations/widget/searchText.dart';
import '../../../splach1/Data/color.dart';
import '../../../Home/Data/book_data.dart'; // هنا قائمة الكتب
import '../../../MyCartPage/reprecentations/widget/MyCartPage.dart';
import '../../../Profile/data/reprecintations/widget/ProfilePage.dart';
import '../../../Book/represintations/widget/Books.dart';
import '../../../../main.dart';

class Books extends StatefulWidget {
  const Books({super.key});

  @override
  State<Books> createState() => _BooksState();
}

class _BooksState extends State<Books> {
  int selectedIndex = 0; // صفحة Books هي الحالية

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.packGround,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: GridView.builder(
                itemCount: recommendedBooks.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.55,
                ),
                itemBuilder: (context, index) {
                  final book = recommendedBooks[index];
                  return BookCard(
                    image: book['image'],
                    title: book['title'],
                    author: book['author'],
                    price: book['price'],
                    rating: book['rating'],
                    reviews: book['reviews'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          switch (index) {
            case 0:
              NavigationHelper.push(context: context, destination: Booksh());              break;
            case 1:
            // in Books page
              break;
            case 2:
            // search Button
              break;
            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Mycartpage()),
              );
              break;
            case 4:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Profilepage()),
              );
              break;
          }
        },
      ),
    );
  }
}
