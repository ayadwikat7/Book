import 'package:flutter/material.dart';
import '../../../../Home/representations/widget/CustomBottomNavBar.dart';
import '../../../../FlashSaleBook/Data/onItemTapped.dart';
import 'ProfileAvatarWidget.dart';
import 'ProfileOptionsList.dart';
import 'package:books/features/splach1/Data/color.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 3; // Profile tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: Column(
          children: const [
            SizedBox(height: 20),
            ProfileAvatarWidget(),
            SizedBox(height: 20),
            ProfileOptionsList(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          BottomNavHandler.onItemTapped(
            context: context,
            index: index,
            currentIndex: selectedIndex,
            updateIndex: (newIndex) {
              setState(() {
                selectedIndex = newIndex;
              });
            },
          );
        },
      ),
    );
  }
}
