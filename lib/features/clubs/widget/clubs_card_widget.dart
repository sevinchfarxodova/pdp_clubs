// widgets/club_card.dart
import 'package:flutter/material.dart';

class ClubCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final VoidCallback onPressed;

  const ClubCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(imageUrl, height: 200, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ElevatedButton(onPressed: onPressed, child: const Text('View more'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
