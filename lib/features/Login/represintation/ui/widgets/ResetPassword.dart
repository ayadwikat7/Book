import 'package:books/features/Login/represintation/ui/widgets/titleAppBar.dart';
import 'package:books/features/splach1/Data/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../splach1/repesentation/ui/widgets/ButtonHomeScreen.dart';
import 'TextFildeLogin.dart';

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Titleappbar(title: 'Reset password',),
        leading:Icon(Icons.navigate_before,) ,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                16,
                25,
                16,
               0),
            child: Column(
              children: [
                Text("Your new password must be",
                  style: TextStyle(
                    fontSize: 14,
                    color: Appcolor.Black
                  ),

                ),
                Text("different from previous one",
                style: TextStyle(
                  fontSize: 14,
                  color: Appcolor.Black
                ),
                ),
                SizedBox(height: 35,),
               /* Textfildelogin(
                  lable: 'Password',
                  hint: '*********',
                  ic: Icons.visibility_off
                  ,

                ),*/
                SizedBox(height: 16,),
               /* Textfildelogin(
                  lable: 'Confirm password',
                  hint: '*********',
                  ic: Icons.visibility_off
                  ,
                ),*/
                SizedBox(height: 32,),
                Buttonhomescreen(
                  BackGround: Appcolor.Pink,
                  Textt: Appcolor.white,
                textButton:"Reset password", onPressed: () {  } ,
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}
