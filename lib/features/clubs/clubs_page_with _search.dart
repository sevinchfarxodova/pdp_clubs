import 'package:flutter/material.dart';
import 'package:pdp_clubs/features/clubs/widget/clubs_card_widget.dart';
import '../../core/routes/app_routes.dart';
import '../dummy_data.dart';

class ClubsPageSearch extends StatelessWidget {
  const ClubsPageSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clubs"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: clubCategories.length,
              itemBuilder: (context, index) {
                final category = clubCategories[index]['category'];
                return ClubCard(
                  title: category,
                  imageUrl: {
                    'Sports Clubs': 'https://i.ytimg.com/vi/ALeOx3k_A9o/maxresdefault.jpg',
                    'Dev Clubs': 'https://university.pdp.uz/static/media/history2019.a638fc9169f3eaa46c3b.jpg',
                    'Book Clubs': 'https://avatars.mds.yandex.net/get-altay/7368569/2a000001845b7928325b9ac45dd074bf535e/orig',
                  }[category] ?? 'https://picsum.photos/300/150',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutesNames.clubsCategory,
                      arguments: category,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}