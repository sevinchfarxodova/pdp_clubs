import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/presentation/clubs_page/widgets/clubs_list.dart';
import 'package:pdp_clubs/src/presentation/clubs_page/widgets/dropdown.dart';
import '../../../constants/colors.dart';
import '../../data/models/club_model.dart';
import '../../data/my_service.dart';

class ClubsPage extends StatefulWidget {
  const ClubsPage({super.key});

  @override
  State<ClubsPage> createState() => _ClubsPageState();
}

class _ClubsPageState extends State<ClubsPage> {
  final ApiService _apiService = ApiService();
  String selectedCategory = "All";
  List<Club> clubs = []; // Use the Club model instead of Map
  List<Club> filteredClubs = []; // Use the Club model here as well
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchClubs();
  }

  Future<void> fetchClubs() async {
    setState(() => isLoading = true);
    try {
      final fetchedClubs = await ApiService.fetchClubs(); // List<Club> expected
      setState(() {
        clubs = fetchedClubs;
        filteredClubs = fetchedClubs;
      });
    } catch (e) {
      print("Error fetching clubs: $e");
    } finally {
      setState(() => isLoading = false);
    }
  }

  void filterClubs(String category) {
    setState(
      () {
        selectedCategory = category;
        filteredClubs = category == "All"
            ? clubs
            : clubs
                .where((club) => club.type == category)
                .toList(); // Use club.type for comparison
      },
    );
  }

  void searchClubs(String query) {
    setState(
      () {
        filteredClubs = clubs
            .where((club) => club.clubName.toLowerCase().contains(
                query.toLowerCase())) // Use club.clubName for searching
            .toList();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clubs", style: TextStyle(color: AppColors.black)),
        actions: [
          CategoryDropdown(
            selectedCategory: selectedCategory,
            categories: ["All", "Technology", "Art", "Games", "Music"],
            // Categories
            onCategoryChanged: filterClubs,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search clubs...",
                prefixIcon: const Icon(Icons.search_outlined),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: searchClubs,
            ),
            const SizedBox(height: 16),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: RefreshIndicator(
                      onRefresh: fetchClubs, // Pull to refresh
                      child: ClubList(clubs: filteredClubs),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
