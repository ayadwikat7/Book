import 'package:flutter/material.dart';
import 'PersonalDataPage.dart';
import 'ProfileOptionItem.dart'; // استدعاء الصفحة الجديدة

class ProfileOptionsList extends StatelessWidget {
  const ProfileOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionItem(
          icon: Icons.person,
          bgColor: Colors.black87,
          title: "Personal data",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PersonalDataPage()),
            );
          },
        ),
        ProfileOptionItem(
          icon: Icons.history,
          bgColor: Colors.orange,
          title: "Order History",
          onTap: () => print("Order History tapped"),
        ),
        ProfileOptionItem(
          icon: Icons.location_on,
          bgColor: Colors.blue,
          title: "Address",
          onTap: () => print("Address tapped"),
        ),
        ProfileOptionItem(
          icon: Icons.help_outline,
          bgColor: Colors.purple,
          title: "Help",
          onTap: () => print("Help tapped"),
        ),
        ProfileOptionItem(
          icon: Icons.logout,
          bgColor: Colors.red,
          title: "Log Out",
          onTap: () => print("Log Out tapped"),
        ),
      ],
    );
  }
}
