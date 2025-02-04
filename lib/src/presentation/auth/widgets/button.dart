import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class Button extends StatelessWidget {
  String? text;
  final VoidCallback onPressed;

  Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text!,
              style: const TextStyle(
                color: AppColors.white, // Text color
                fontSize: 16, // Font size
              ),
            )
          ],
        ),
      ),
    );
  }
}
