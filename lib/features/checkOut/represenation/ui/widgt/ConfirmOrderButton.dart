import 'package:flutter/material.dart';

class ConfirmOrderButton extends StatelessWidget {
  final VoidCallback onConfirm;

  const ConfirmOrderButton({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: onConfirm,
        child: const Text(
          "Confirm order",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
