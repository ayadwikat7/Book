import 'package:books/features/splach1/Data/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../splach1/repesentation/ui/widgets/ButtonHomeScreen.dart';

class Passwordchanged extends StatelessWidget {
  const Passwordchanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.navigate_before),),
      body:Padding(
        padding: const EdgeInsets.only(top: 160),
        child: Center(
          child: Column(
            children: [
              Icon(Icons.check_circle,
                color: Appcolor.CheckColor,
              size: 120,
              ),
              SizedBox(height: 24,),
              Text("Password Changed!",
              style: TextStyle(
                color: Appcolor.Black,
                fontSize: 22
              ),
              ),
              SizedBox(height: 16,),
              Text("Your password has been",
              style: TextStyle(
                color: Appcolor.Black,
                fontSize: 12
              ),
              ),
              Text("changed successfully ",
              style: TextStyle(

                color: Appcolor.Black,
                fontSize: 12
              ),),
              SizedBox(height: 24,),
              Buttonhomescreen(
                BackGround:Appcolor.Pink,
                Textt:Appcolor.white,
                textButton: "Finish!", onPressed: () {  },

              )
            ],
          ),
        ),
      ),
    );
  }
}
