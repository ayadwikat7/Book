import 'package:flutter/material.dart';
import '../../../splach1/Data/color.dart';

class Searchtext extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const Searchtext({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Appcolor.BorderSearch),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onSearch, // كلما كتب المستخدم شيء يتم استدعاء onSearch
              decoration: const InputDecoration(
                hintText: "Search",
                border: InputBorder.none,
              ),
            ),
          ),
          Icon(Icons.mic_none, color: Appcolor.BorderSearch),
          const VerticalDivider(
            color: Appcolor.BorderSearch,
            thickness: 1,
            width: 20,
          ),
          Icon(Icons.search, color: Appcolor.Pink),
        ],
      ),
    );
  }
}
