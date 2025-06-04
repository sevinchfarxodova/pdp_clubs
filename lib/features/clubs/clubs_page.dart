import 'package:flutter/material.dart';
import 'package:pdp_clubs/features/clubs/widget/clubs_card_widget.dart';
import '../dummy_data.dart';
import 'club_page_detail.dart';

class ClubsPage extends StatelessWidget {
  final String category;

  const ClubsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> clubs = clubCategories
        .firstWhere(
          (cat) => cat['category'].toString().toLowerCase() == category.toLowerCase(),
      orElse: () => {'clubs': []},
    )['clubs'] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text('Available $category')),
      body: clubs.isEmpty
          ? const Center(child: Text('No clubs found for this category.'))
          : ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: clubs.length,
        itemBuilder: (context, index) {
          final club = clubs[index];
          return ClubCard(
            title: club['title'],
            imageUrl: club['imageUrl'],
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ClubDetailPage(
                    title: club['title'],
                    imageUrl: club['imageUrl'],
                    manager: club['manager'],
                    activeMembers: club['activeMembers'],
                    description: club['description'],
                    skills: club['skills'],
                    objectives: club['objectives'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}