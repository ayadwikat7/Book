import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../splach1/Data/color.dart';

class Textfildelogin extends StatefulWidget {
  final String lable;
  final String hint;
  final IconData? ic;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final String? errorText;

  const Textfildelogin({
    super.key,
    required this.lable,
    required this.hint,
    this.ic,
    required this.controller,
    this.validator,
    this.isPassword = false,
    this.errorText,
  });

  @override
  State<Textfildelogin> createState() => _TextfildeloginState();
}

class _TextfildeloginState extends State<Textfildelogin> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.lable,
          style: const TextStyle(
            fontSize: 16,
            fontFamily: "Open Sans",
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.isPassword ? _obscureText : false,
          decoration: InputDecoration(
            hintText: widget.hint,
            errorText: widget.errorText,
            hintStyle: TextStyle(
              fontSize: 12,
              fontFamily: "Open Sans",
              color: Appcolor.hintColor,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            )
                : (widget.ic != null ? Icon(widget.ic) : null),
          ),
        ),
      ],
    );
  }
}
