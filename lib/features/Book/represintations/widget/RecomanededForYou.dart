import 'package:flutter/material.dart';
import '../../../Home/Data/book_service.dart';
import '../../../splach1/Data/color.dart';
import '../../../Home/representations/widget/Navigator.dart';
import 'RecommendedForYouBookItem.dart';

class Recomanededforyou extends StatefulWidget {
  const Recomanededforyou({super.key});

  @override
  State<Recomanededforyou> createState() => _RecomanededforyouState();
}

class _RecomanededforyouState extends State<Recomanededforyou> {
  final ScrollController _scrollController = ScrollController();
  final BookService _bookService = BookService();

  List<Map<String, dynamic>> recommendedBooks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchRecommendedBooks();
  }

  Future<void> _fetchRecommendedBooks() async {
    try {
      final books = await _bookService.getRecommendedBooks();
      setState(() {
        recommendedBooks = books;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching recommended books: $e");
    }
  }

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 300,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator(color: Appcolor.Pink));
    }

    if (recommendedBooks.isEmpty) {
      return const Center(child: Text("No recommended books found."));
    }

    return Column(
      children: [
        SizedBox(
          height: 160,
          child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: recommendedBooks.length,
            itemBuilder: (context, index) {
              final book = recommendedBooks[index];
              return Recommendedforyoubookitem(
                image: book['image'],
                title: book['title'],
                author: book['author'],
                oldPrice: (book['price'] + 15).toDouble(),
                newPrice: (book['price']).toDouble(),
                rating: double.tryParse(book['rating'].toString()) ?? 0.0,
                booksLeft: book['reviews'] ?? 0,
                onCartPressed: () {},
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavigatorButton(icon: Icons.arrow_back_ios, onPressed: _scrollLeft),
            const SizedBox(width: 10),
            NavigatorButton(icon: Icons.arrow_forward_ios, onPressed: _scrollRight),
          ],
        ),
      ],
    );
  }
}
