import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/data/models/club_model.dart';

import '../../../../constants/colors.dart';
import '../clubs_details.dart';

class ClubList extends StatelessWidget {
  final List<Club> clubs;

  const ClubList({super.key, required this.clubs});

  // 000
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
              borderRadius: BorderRadius.circular(2),
              child: Image.network(
                club.img ?? "",
                width: 54,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(club.clubName,
                style: const TextStyle(
                    fontWeight: FontWeight.w500)),
            subtitle: Text(club.type,
                    style:  TextStyle(
                        color: AppColors.blue)),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
                size: 20,),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                      ClubDetailsPage(club: club),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
