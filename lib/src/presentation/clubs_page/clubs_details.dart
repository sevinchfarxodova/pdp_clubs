import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClubDetailsPage extends StatelessWidget {
  final Map<String, String> club;
  const ClubDetailsPage({required this.club, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(club["name"]!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(club["info"]!, style: const TextStyle(fontSize: 16)),
             SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
