import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Textcode extends StatelessWidget {
  const Textcode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      child: TextFormField(
        decoration: InputDecoration(
            border:OutlineInputBorder(
                borderRadius: BorderRadius.circular(8)
            )
        ),
      ),
    )
    ;
  }
}
