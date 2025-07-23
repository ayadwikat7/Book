import 'package:flutter/material.dart';
import '../../Book/represintations/widget/Books.dart';
import '../../Home/representations/widget/BooksH.dart';
import '../../MyCartPage/reprecentations/widget/MyCartPage.dart';
import '../../Profile/data/reprecintations/widget/ProfilePage.dart';
import '../../splach1/repesentation/ui/widgets/Helper.dart';

class BottomNavHandler {
  static void onItemTapped({
    required BuildContext context,
    required int index,
    required int currentIndex,
    required Function(int) updateIndex,
  }) {
    if (index == currentIndex) return;

    updateIndex(index);

    switch (index) {
      case 0:
        NavigationHelper.pushReplacement(
            context: context, destination: Booksh());
        break;
      case 1:
        NavigationHelper.pushReplacement(
            context: context, destination: Books());
        break;
      case 2:
      // Search button logic
        break;
      case 3:
        NavigationHelper.pushReplacement(
            context: context, destination: Mycartpage());
        break;
      case 4:
        NavigationHelper.pushReplacement(
            context: context, destination: Profilepage());
        break;
    }
  }
}
