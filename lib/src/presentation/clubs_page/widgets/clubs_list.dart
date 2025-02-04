import 'package:flutter/cupertino.dart';

import 'clubs_card.dart';

class ClubList extends StatelessWidget {
  final List<Map<String, String>> clubs;
  const ClubList({required this.clubs, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: clubs.length,
      itemBuilder: (context, index) {
        return ClubCard(club: clubs[index]);
      },
    );
  }
}
