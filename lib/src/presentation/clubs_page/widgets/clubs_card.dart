import 'package:flutter/material.dart';

import '../clubs_details.dart';

class ClubCard extends StatelessWidget {
  final Map<String, String> club;
  const ClubCard({required this.club, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ClubDetailsPage(club: club),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              club["image"]!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(club["name"]!),
          subtitle: Text(club["category"]!),
        ),
      ),
    );
  }
}
