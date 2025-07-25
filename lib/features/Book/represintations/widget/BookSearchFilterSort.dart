import 'package:flutter/material.dart';

class BookSearchFilterSort extends StatelessWidget {
  final Function(String) onSearch;
  final Function(String) onSort;
  final VoidCallback onFilter;

  const BookSearchFilterSort({
    super.key,
    required this.onSearch,
    required this.onSort,
    required this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    String selectedSort = 'Default';

    return Column(
      children: [
        // --- Search Bar ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: TextField(
            controller: searchController,
            onChanged: (value) => onSearch(value),
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  searchController.clear();
                  onSearch('');
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            ),
          ),
        ),

        // --- Filter & Sort Row ---
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              // Filter Button
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onFilter,
                  icon: const Icon(Icons.filter_list, color: Colors.black),
                  label: const Text('Filter', style: TextStyle(color: Colors.black)),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              // Sort Dropdown
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: selectedSort,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  items: const [
                    DropdownMenuItem(value: 'Default', child: Text('Sort by')),
                    DropdownMenuItem(value: 'PriceAsc', child: Text('Price: Low to High')),
                    DropdownMenuItem(value: 'PriceDesc', child: Text('Price: High to Low')),
                    DropdownMenuItem(value: 'Rating', child: Text('Top Rated')),
                  ],
                  onChanged: (value) {
                    if (value != null) onSort(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
