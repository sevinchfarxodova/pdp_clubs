import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/data/models/club_model.dart';

class ClubList extends StatelessWidget {
  final List<Club> clubs;

  const ClubList({super.key, required this.clubs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clubs.length,
      itemBuilder: (context, index) {
        final club = clubs[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                club.img ?? "",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(club.clubName,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle:
                Text(club.type, style: const TextStyle(color: Colors.grey)),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Add navigation to club details page if needed
            },
          ),
        );
      },
    );
  }
}
