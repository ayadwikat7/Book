import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Data/color.dart';

class Buttonhomescreen extends StatefulWidget {
  Color BackGround;
  Color Textt;
  double left;
  double right;
  double top;
  double bottom;
  String ?textButton;
  final VoidCallback onPressed;

  Buttonhomescreen({
    super.key,
    required this.BackGround,
    required this.Textt,
    this.left = 0.0,
    this.right = 0.0,
    this.top = 0.0,
    this.bottom = 0.0,
     this.textButton,
    required this.onPressed,
  });

  @override
  State<Buttonhomescreen> createState() => _ButtonhomescreenState();
}

class _ButtonhomescreenState extends State<Buttonhomescreen> {
  double ?width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(
          widget.left ,
          widget.right,
          widget.top,
          widget.bottom),
      child: SizedBox(
        width: 343,
        height: 48,
        child: ElevatedButton(onPressed: widget.onPressed,
            style:ElevatedButton.styleFrom(
                backgroundColor: widget.BackGround,
                shape: RoundedRectangleBorder(

                  borderRadius: BorderRadius.circular(8),

                )
            ),
            child: Text(widget.textButton.toString(),style:
            TextStyle(
              fontSize: 16,
                color:widget.Textt,
            ),)),
      ),
    );
  }
}
