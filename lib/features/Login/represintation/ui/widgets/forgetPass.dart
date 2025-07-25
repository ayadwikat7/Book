import 'package:books/features/Login/represintation/ui/widgets/titleAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../splach1/Data/color.dart';
import '../../../../splach1/repesentation/ui/widgets/ButtonHomeScreen.dart';
import '../../../../splach1/repesentation/ui/widgets/Helper.dart';
import 'TextFildeLogin.dart';

class forgetPass extends StatelessWidget {
  const forgetPass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Titleappbar(title: 'Forget password',),
        leading:
        IconButton(onPressed: (){
          NavigationHelper.pop(context);
        }, icon:
        Icon(
          Icons.navigate_before,
          color: Appcolor.Black,),
        )
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:24),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                15,
                16,
               15,
                0
            ),
            child: Column(
              children: [
                Text("Enter your email",
                style: TextStyle(
                  fontSize: 14,
                  color: Appcolor.Black
                ),),
                Text('to reset your password',
                style: TextStyle(
                  fontSize: 14,
                  color: Appcolor.Black
                ),),
                SizedBox(height: 32,),
                /*Textfildelogin(
                  lable: 'Email',
                  hint: 'Example@gmail.com',
                  ic: null,

                ),*/
                SizedBox(height: 32,),
                Buttonhomescreen(
                  BackGround: Appcolor.Pink,
                  Textt: Appcolor.white,
                  textButton: "Send code", onPressed: () {  },
                )
              ],
            ),
          ),
        ),
      ),

    );
    
  }
}
