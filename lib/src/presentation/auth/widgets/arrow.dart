import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class Arrow extends StatelessWidget {
  final VoidCallback onPressed;

  Arrow({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            disabledBackgroundColor: AppColors.white
        ),
        onPressed:onPressed,
    child: IconButton(onPressed: onPressed, icon: const Icon(
    Icons.arrow_back_ios,
    color: Colors.black,
      size: 24.0,
    ),));
  }}