import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/presentation/clubs_page/widgets/clubs_list.dart';
import 'package:pdp_clubs/src/presentation/clubs_page/widgets/dropdown.dart';

import '../../../constants/colors.dart';

class ClubsPage extends StatefulWidget {
  const ClubsPage({super.key});

  @override
  State<ClubsPage> createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {
  String selectedCategory = "All";
  final List<String> categories = [
    "All",
    "San’at",
    "Sport",
    "Ilmiy",
    "Texnologiya",
    "Ijtimoiy"
  ];

  final List<Map<String, String>> clubs = [
    {
      "name": "Art Club",
      "category": "San’at",
      "image": "assets/images/director_photo.jpg"
    },
    {
      "name": "Football Club",
      "category": "Sport",
      "image": "assets/images/director_photo.jpg"
    },
    {
      "name": "Science Club",
      "category": "Ilmiy",
      "image": "assets/images/director_photo.jpg"
    },
    {
      "name": "Coding Club",
      "category": "Texnologiya",
      "image": "assets/images/director_photo.jpg"
    },
    {
      "name": "Music Club",
      "category": "San’at",
      "image": "assets/images/director_photo.jpg"
    },
    {
      "name": "Basketball Club",
      "category": "Sport",
      "image": "assets/images/director_photo.jpg"
    },
    {
      "name": "Astronomy Club",
      "category": "Ilmiy",
      "image": "assets/images/director_photo.jpg"
    },
    {
      "name": "Entrepreneurship Club",
      "category": "Ijtimoiy",
      "image": "assets/images/director_photo.jpg"
    },
  ];

  List<Map<String, String>> filteredClubs = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        filteredClubs = clubs; // Ensure UI updates after layout is ready
      });
    });
  }

  void filterClubs(String category) {
    setState(() {
      selectedCategory = category;
      filteredClubs = category == "All"
          ? clubs
          : clubs.where((club) => club["category"] == category).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clubs", style: TextStyle(color: AppColors.black)),
        actions: [
          CategoryDropdown(
            selectedCategory: selectedCategory,
            categories: categories,
            onCategoryChanged: filterClubs,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search clubs...",
                  prefixIcon: Icon(Icons.search_outlined),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (query) {
                  setState(() {
                    filteredClubs = clubs
                        .where((club) => club["name"]!
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  });
                },
              ),
              const SizedBox(height: 16),
        SizedBox(
          height: 500,
          child: ClubList(clubs: filteredClubs),
        ),
            ],
          ),
        ),
      ),
    );
  }
}
