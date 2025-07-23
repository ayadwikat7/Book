import 'package:flutter/material.dart';

class BookImageSection extends StatefulWidget {
  final List<String> images; // صور الكتاب (وجه + ظهر)
  final VoidCallback? onShare;
  final VoidCallback? onFavorite;

  const BookImageSection({
    super.key,
    required this.images,
    this.onShare,
    this.onFavorite,
  });

  @override
  State<BookImageSection> createState() => _BookImageSectionState();
}

class _BookImageSectionState extends State<BookImageSection> {
  int selectedIndex = 0; // الصورة الحالية

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // الصورة الرئيسية
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.images[selectedIndex],
              height: 280,
              width: MediaQuery.of(context).size.width * 0.55,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          // العمود الأيمن (أزرار + صور مصغرة)
          Expanded(
            child: Column(
              children: [
                _circleIconButton(Icons.favorite_border, widget.onFavorite),
                const SizedBox(height: 8),
                _circleIconButton(Icons.share, widget.onShare),
                const SizedBox(height: 16),
                // الصور المصغرة
                Column(
                  children: List.generate(widget.images.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: selectedIndex == index
                                ? Colors.pink
                                : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            widget.images[index],
                            height: 60,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIconButton(IconData icon, VoidCallback? onTap) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.black),
        onPressed: onTap,
      ),
    );
  }
}
