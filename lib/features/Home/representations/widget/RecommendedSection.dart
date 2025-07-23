import 'package:flutter/material.dart';
import '../../../Book/represintations/widget/Books.dart';
import '../../../Book/represintations/widget/Bookdetails.dart';
import '../../../splach1/Data/color.dart';
import '../../../splach1/repesentation/ui/widgets/Helper.dart';
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
          // عنوان القسم وزر See all
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Recommended for you',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              TextButton(
                onPressed: () {
                  // الانتقال إلى صفحة جميع الكتب
                  NavigationHelper.push(
                    context: context,
                    destination: const Books(),
                  );
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
              return GestureDetector(
                onTap: () {
                  // فتح صفحة التفاصيل عند الضغط على صورة الكتاب
                  NavigationHelper.push(
                    context: context,
                    destination: Bookdetails(book: book),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: RecommendedBookItem(
                    image: book['image'],
                    title: book['title'],
                    author: book['author'],
                    price: book['price'],
                    rating: book['rating'],
                    reviews: book['reviews'],
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
