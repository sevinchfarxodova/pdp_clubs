// pages/club_detail_page.dart
import 'package:flutter/material.dart';

class ClubDetailPage extends StatelessWidget {
  final String title, imageUrl, description, skills, objectives, manager;
  final int activeMembers;

  const ClubDetailPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.skills,
    required this.objectives,
    required this.manager,
    required this.activeMembers,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sport Clubs'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Club Manager', style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(manager),
                  ],
                ),
              ],
            ),
            Text('Active Members: $activeMembers'),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(text: 'Description: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: description),
                ],
              ),
            ),
            const SizedBox(height: 6),
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black),
                children: [
                  const TextSpan(text: 'Required Skills: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: skills),
                ],
              ),
            ),
            const SizedBox(height: 6),
            const Text('Objectives:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(objectives),
          ],
        ),
      ),
    );
  }
}
