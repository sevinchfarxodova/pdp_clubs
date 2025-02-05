import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/presentation/clubs_page/widgets/clubs_controller.dart';
import 'package:pdp_clubs/src/presentation/clubs_page/widgets/clubs_list.dart';
import 'package:pdp_clubs/src/presentation/clubs_page/widgets/dropdown.dart';
import 'package:pdp_clubs/src/presentation/clubs_page/widgets/search_field.dart';
import '../../../constants/colors.dart';
import 'package:provider/provider.dart';

class ClubsPage extends StatelessWidget {
  const ClubsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ClubsController(), // Provide the controller
      child: Consumer<ClubsController>(
        builder: (context, controller, child) {
          return Scaffold(
            appBar: AppBar(
              title: Center(
                child: Text(
                  "Clubs 🎭",
                  style: TextStyle(fontSize: 20, color: AppColors.blue),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CategoryDropdown(
                    selectedCategory: controller.selectedCategory,
                    categories: controller.categories,
                    onCategoryChanged: controller.filterClubs,
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SearchField(onSearch: controller.searchClubs),
                  const SizedBox(height: 16),
                  controller.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                          child: RefreshIndicator(
                            onRefresh: controller.fetchClubs,
                            child: ClubList(clubs: controller.filteredClubs),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
