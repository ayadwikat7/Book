import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../createAccount/Repesentation/ui/widget/CreateAccount.dart';
import '../../../../Login/represintation/ui/widgets/LoginScreen.dart';
import '../../../../splach1/Data/color.dart';
import '../../../../splach1/repesentation/ui/widgets/ButtonHomeScreen.dart';
import '../../../../splach1/repesentation/ui/widgets/Helper.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(

        children: [
          Positioned.fill(
      child: Image.asset(
        "assets/images/splash2.png",
        fit: BoxFit.cover,
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: Icon(
                          Icons.book_outlined,
                          color:Appcolor.white ,
                          size: 60,
                        ),
                      ),
                      SizedBox(width: 8,),
                      Text("BookShop",
                      style:
                      TextStyle(color: Appcolor.white,
                      fontSize: 30,
                        fontFamily: 'Open Sans',


                      )
                        ,)
                    ],
                  ),
                  SizedBox(height: 80,),
                  Buttonhomescreen(
                    BackGround: Appcolor.Pink,
                    Textt: Appcolor.white,
                    left: 16,
                    right: 16,
                    top: 13,
                    bottom: 13,
                    textButton: "Log in",
                    onPressed: () {
                      print("Login button clicked");
                      NavigationHelper.push(context: context, destination: Loginscreen());
                    },

                  ),

                  Buttonhomescreen(
                    BackGround:Appcolor.white ,
                    Textt:Appcolor.Pink,
                    left:16,
                    right:16,
                    top:13,
                    bottom:13,
                    textButton:"Create account", onPressed: () {

                    NavigationHelper.push(context: context, destination: Createaccount());
                  },
                  )

                ],
              )
            ],
          )
        ],

      ),

    );
  }
}
