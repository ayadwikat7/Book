import 'package:books/features/Home/representations/widget/searchText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../splach1/Data/color.dart';

class Appbarewithsearch extends StatelessWidget implements PreferredSizeWidget {
  const Appbarewithsearch({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(100),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
          child: Row(
            children: [

              Expanded(
                child: Searchtext()
              ),

              SizedBox(width: 12),

              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Appcolor.Pink,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.shopping_cart, color: Appcolor.white, size: 22),
              ),

              SizedBox(width: 8),

              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  border: Border.all(color: Appcolor.Pink),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.favorite_border, color: Appcolor.Pink, size: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
