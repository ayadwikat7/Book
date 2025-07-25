import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../splach1/Data/color.dart';

class Loginwith extends StatelessWidget {
  IconData ?logo;
  String Texts;
  Color logoColor;
  String? google;
  VoidCallback? onTap;
   Loginwith({
    super.key,
    required this.logo,
    required this.Texts,
     required this.logoColor,
     required this.google,
     required this.onTap

  });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onTap,
      child: Container(
        width: 163.5,
        height: 54,
        decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Appcolor.BorderColor)
        ) ,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo!=null?
            Icon(logo,color:logoColor,):
            Image.asset(google.toString()),
            SizedBox(width: 8,),
            Text(Texts.toString())
          ],
        ),
      
      ),
    );
  }
}
