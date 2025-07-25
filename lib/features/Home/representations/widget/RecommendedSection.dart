import 'package:flutter/material.dart';
import '../../../Book/represintations/widget/BookDetails.dart';
import '../../../splach1/Data/color.dart';
import '../../../splach1/repesentation/ui/widgets/Helper.dart'; // يحتوي على NavigationHelper
import 'RecommendedBookItem.dart';

class RecommendedSection extends StatelessWidget {
  final List<Map<String, dynamic>> books;

  const RecommendedSection({super.key, required this.books});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان وزر See all
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recommended for you',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  // يمكنك هنا التنقل لصفحة جميع الكتب
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Appcolor.Pink,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // قائمة الكتب
          Column(
            children: books.map((book) {
              final int bookId = book['id'] ?? 0;

              return GestureDetector(
                onTap: () {
                  NavigationHelper.push(
                    context: context,
                    destination: BookDetailsPage(bookId: bookId),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: RecommendedBookItem(
                    image: book['image'] ?? '',
                    title: book['title'] ?? '',
                    author: book['author'] ?? '',
                    price: (book['price'] is int)
                        ? (book['price'] as int).toDouble()
                        : (book['price'] ?? 0.0),
                    rating: (book['rating'] is int)
                        ? (book['rating'] as int).toDouble()
                        : (book['rating'] ?? 0.0),
                    reviews: book['reviews'] ?? 0,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
