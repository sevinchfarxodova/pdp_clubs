import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../data/models/club_model.dart';
import '../../../data/my_service.dart';

class CategoryDropdown extends StatefulWidget {
  final String selectedCategory;
  final List<String> categories;
  final ValueChanged<String> onCategoryChanged;

  const CategoryDropdown({
    super.key,
    required this.selectedCategory,
    required this.categories,
    required this.onCategoryChanged,
  });

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  final ApiService _apiService = ApiService();
  String selectedCategory = "All";
  List<Club> clubs = [];
  List<Club> filteredClubs = [];
  bool isLoading = true;
  final List<String> categories = [];

@override

void initState() {
  super.initState();
  fetchClubs();
}

Future<void> fetchClubs() async {
  setState(() => isLoading = true);
  try {
    final fetchedClubs = await ApiService.fetchClubs();
    final fetchedCategories =
    fetchedClubs.map((club) => club.type).toSet().toList();
    setState(() {
      clubs = fetchedClubs;
      filteredClubs = fetchedClubs;
      categories.clear();
      categories.add("All");
      categories.addAll(fetchedCategories);
    });
  } catch (e) {
    print("Error fetching clubs: $e");
  } finally {
    setState(() => isLoading = false);
  }
}

  void filterClubs(String category) {
    setState(() {
      selectedCategory = category;
      filteredClubs = category == "All"
          ? clubs
          : clubs.where((club) => club.type == category).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.06,
        width: MediaQuery.of(context).size.width * 0.2,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.blue ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.selectedCategory,
          icon: Icon(
            Icons.arrow_drop_down_circle,
            color: AppColors.white,
            size: 25,),
            style: TextStyle(
              color: AppColors.white,),
               onChanged: (value) {
                if (value != null) {
              widget.onCategoryChanged(value);
            }
          },
          items: widget.categories.map((category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category,
                  selectionColor: AppColors.blue,
                  style: TextStyle(
                    fontSize: 12,
                  color: AppColors.black)),
            );
          }).toList(),
        ),
      ),
    );
  }
}
