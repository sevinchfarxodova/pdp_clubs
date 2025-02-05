import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';

class SearchField extends StatelessWidget {
  final ValueChanged<String> onSearch;

  const SearchField({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search clubs...",
          prefixIcon: const Icon(Icons.search_outlined, color: AppColors.blue),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear, color: Colors.grey),
            onPressed: () {
              onSearch(""); // Clear search
            },
          ),
          border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.white,
        ),
        onChanged: onSearch, // Calls the function from the parent
      ),
    );
  }
}
