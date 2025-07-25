import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../spalsh2/repesentation/ui/widgets/splash2HomeScreen.dart';
import 'Helper.dart';

class spalshBook extends StatefulWidget {
  const spalshBook({super.key});

  @override
  State<spalshBook> createState() => _spalshBookState();
}

class _spalshBookState extends State<spalshBook> {
  void initState() {
    super.initState();
    NavigationHelper.navigateWithDelay(
      context: context,
      destination: homeScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(

            child: Image.asset("assets/images/splash1.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),

          ),
        ],
      ),

    );
  }
}
