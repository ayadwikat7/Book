import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../../Book/represintations/widget/Books.dart';
import '../../../MyCartPage/reprecentations/widget/MyCartPage.dart';
import '../../../Profile/data/reprecintations/widget/ProfilePage.dart';
import '../../../splach1/Data/color.dart';
import '../../../splach1/repesentation/ui/widgets/Helper.dart';
import '../../Data/book_data.dart';
import 'AppBareWithSearch.dart';
import 'CustomBottomNavBar.dart';
import 'Navigator.dart';
import 'RecommendedBookItem.dart';

class Booksh extends StatefulWidget {
  const Booksh({super.key});

  @override
  State<Booksh> createState() => _BookshState();
}
int selectedIndex = 0; //

class _BookshState extends State<Booksh> {
  final ScrollController _scrollController = ScrollController();

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
    return Scaffold(
      backgroundColor: Appcolor.BackGround,
      appBar: Appbarewithsearch(),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 90),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔸 Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Text(
                  'Best seller',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),

              // 🔸 Horizontal Scroll of Book Covers
              SizedBox(
                height: 170,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: recommendedBooks.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return _bookCover(recommendedBooks[index]['image']);
                  },
                ),
              ),

              const SizedBox(height: 16),

              // 🔸 Arrows
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavigatorButton(icon: Icons.arrow_back_ios, onPressed: _scrollLeft),
                  const SizedBox(width: 12),
                  NavigatorButton(icon: Icons.arrow_forward_ios, onPressed: _scrollRight),
                ],
              ),

              const SizedBox(height: 24),

              // 🔸 Recommended Section Title
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recommended for you',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Appcolor.Pink,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              // 🔸 Recommended Book List
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: recommendedBooks.map((book) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: RecommendedBookItem(
                        image: book['image'],
                        title: book['title'],
                        author: book['author'],
                        price: book['price'],
                        rating: book['rating'],
                        reviews: book['reviews'],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
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
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              NavigationHelper.push(context: context, destination: Books());
              break;
            case 2:
            // Example: open search page or do something
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

  Widget _bookCover(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        imageUrl,
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
    );
  }
}
