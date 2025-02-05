import 'package:flutter/material.dart';

import '../../../data/models/club_model.dart';
import '../../../data/my_service.dart';

class ClubsController extends ChangeNotifier {
  String selectedCategory = "All";
  List<Club> clubs = [];
  List<Club> filteredClubs = [];
  bool isLoading = true;
  final List<String> categories = [];

  ClubsController() {
    fetchClubs();
  }

  Future<void> fetchClubs() async {
    isLoading = true;
    notifyListeners();

    try {
      final fetchedClubs = await ApiService.fetchClubs();
      final fetchedCategories = fetchedClubs.map((club) => club.type).toSet().toList();

      clubs = fetchedClubs;
      filteredClubs = fetchedClubs;
      categories.clear();
      categories.add("All");
      categories.addAll(fetchedCategories);
    } catch (e) {
      print("Error fetching clubs: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void filterClubs(String category) {
    selectedCategory = category;
    filteredClubs = category == "All"
        ? clubs
        : clubs.where((club) => club.type == category).toList();
    notifyListeners();
  }

  void searchClubs(String query) {
    filteredClubs = clubs
        .where((club) => club.clubName.toLowerCase().contains(query.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
