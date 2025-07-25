import 'package:books/features/Login/represintation/ui/widgets/titleAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../splach1/Data/color.dart';
import '../../../../splach1/repesentation/ui/widgets/ButtonHomeScreen.dart';
import 'TextCode.dart';

class enterCode extends StatelessWidget {
  const enterCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.navigate_before),
        title: Titleappbar(title: 'Enter code',),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Text("Enter the 4 digits code that ",
                  style:TextStyle(fontSize: 14,color: Appcolor.Black) ,),
                Text("you received on your email",
                style: TextStyle(fontSize: 14,
                color: Appcolor.Black
                ),
                ),
                SizedBox(height: 32,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
          
                    Textcode(),
                    SizedBox(width: 24,),
                    Textcode(),
                    SizedBox(width: 24,),
                    Textcode(),
                    SizedBox(width: 24,),
                    Textcode(),
                  ],
                ),
                SizedBox(height: 40,),
                Buttonhomescreen(
                  BackGround:Appcolor.Pink,
                  Textt: Appcolor.white,
                  textButton: "Send", onPressed: () {  },
                ),
                SizedBox(height: 60,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn’t receive a code? ",
                      style:TextStyle(
                          color: Appcolor.Black,
                        fontSize: 14
                      ) ,),
                    TextButton(onPressed: (){},
                        child:Text("Send again",
                          style:TextStyle(
                            color: Appcolor.Pink,
                            fontSize: 14
                          ) ,)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
