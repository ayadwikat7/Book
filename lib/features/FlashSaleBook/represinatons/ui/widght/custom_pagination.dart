import 'package:flutter/material.dart';

import '../../../../splach1/Data/color.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  const CustomPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // زر Previous
          TextButton(
            onPressed: currentPage > 0 ? () => onPageChanged(currentPage - 1) : null,
            child: Text(
              '< Previous',
              style: TextStyle(
                color: currentPage > 0 ? Appcolor.Pink : Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          ...List.generate(totalPages, (index) {
            final isActive = index == currentPage;
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () => onPageChanged(index),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isActive ? Appcolor.Pink : Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: isActive ? Appcolor.Pink : Colors.grey.shade300,
                    ),
                  ),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isActive ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }),

          // زر Next
          TextButton(
            onPressed: currentPage < totalPages - 1
                ? () => onPageChanged(currentPage + 1)
                : null,
            child: Text(
              'Next >',
              style: TextStyle(
                color: currentPage < totalPages - 1
                    ? Appcolor.Pink
                    : Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
