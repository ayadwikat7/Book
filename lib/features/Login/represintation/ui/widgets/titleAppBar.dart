import 'package:flutter/cupertino.dart';

import '../../../../splach1/Data/color.dart';

class Titleappbar extends StatelessWidget {
  String title;
   Titleappbar({super.key,
  required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(title.toString(),
      style: TextStyle(
          fontSize: 16,
          color: Appcolor.Black,
          fontFamily: "Open Sans"
      ),
    );
  }
}
