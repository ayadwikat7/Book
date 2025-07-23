import 'package:flutter/material.dart';

class ProductDetailsSection extends StatelessWidget {
  final Map<String, dynamic> book;

  const ProductDetailsSection({super.key, required this.book});

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$label : ",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailRow("Book Title", book['title']),
          _buildDetailRow("Author", book['author']),
          _buildDetailRow("Publication Date", book['publicationDate'] ?? '1997'),
          _buildDetailRow("ASIN", book['asin'] ?? 'B09TWSRMCB'),
          _buildDetailRow("Language", book['language'] ?? 'English'),
          _buildDetailRow("Publisher", book['publisher'] ?? 'Printer'),
          _buildDetailRow("Pages", (book['pages'] ?? '336').toString()),
          _buildDetailRow("Book Format", book['format'] ?? 'Hard Cover'),
          _buildDetailRow("Best Seller Rank", "#${book['rank'] ?? 3}"),
        ],
      ),
    );
  }
}
