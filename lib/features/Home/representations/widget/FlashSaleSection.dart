import 'package:flutter/material.dart';
import '../../../Book/represintations/widget/BookDetails.dart';
import '../../../FlashSaleBook/represinatons/ui/widght/FlashSaleBook.dart';
import '../../../splach1/Data/color.dart';
import '../../../splach1/repesentation/ui/widgets/Helper.dart';

class FlashSaleSection extends StatelessWidget {
  final List<Map<String, dynamic>> books;

  const FlashSaleSection({super.key, required this.books});

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
                'Flash sale',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  // الانتقال إلى صفحة Flashsalebook عند الضغط على See all
                  NavigationHelper.push(
                    context: context,
                    destination: Flashsalebook(),
                  );
                },
                child: Text(
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
              return flashBookItem(context, book);
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// عنصر الكتاب داخل Flash Sale
  static Widget flashBookItem(BuildContext context, Map<String, dynamic> book) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailsPage(bookId: book['id']),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Appcolor.FlashSaleColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                book['image'],
                width: 60,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book['title'],
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Appcolor.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Author: ${book['author']}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Appcolor.white3,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Appcolor.StarsColor, size: 16),
                      Text('${book['rating']}',
                          style: const TextStyle(color: Appcolor.white)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${book['price']}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Appcolor.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Appcolor.Pink,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.shopping_cart,
                  color: Appcolor.white, size: 18),
            ),
          ],
        ),
      ),
    );
  }


}
