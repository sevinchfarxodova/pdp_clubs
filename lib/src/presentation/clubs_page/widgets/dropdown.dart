import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';

class CategoryDropdown extends StatelessWidget {
  final String selectedCategory;
  final List<String> categories;
  final ValueChanged<String> onCategoryChanged;

  const CategoryDropdown({
    required this.selectedCategory,
    required this.categories,
    required this.onCategoryChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedCategory,
      dropdownColor: AppColors.white,
      icon: const Icon(Icons.arrow_drop_down, color: AppColors.blue),
      style: TextStyle(color: AppColors.blue, fontWeight: FontWeight.bold),
      items: categories.map((category) => DropdownMenuItem(
        value: category,
        child: Text(category, style: TextStyle(fontSize: 16)),
      )).toList(),
      onChanged: (newValue) => onCategoryChanged(newValue!),
    );
  }
}
