import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/presentation/clubs_page/clubs_page.dart';
import 'package:pdp_clubs/src/presentation/home_page/home_page.dart';
import 'constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  List<Widget> pages = [
     HomePage(),
     ClubsPage(),
     HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.blue,
        currentIndex: _currentIndex,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        onTap: (int newIndex) {
          setState(() {
            if (newIndex == 1) {
              pages[1] = const ClubsPage();
            }
            _currentIndex = newIndex;
          });
        },
        items: [
          bottomNavigationBarWidget(
            "assets/images/img.png",
            "Home",
          ),
          bottomNavigationBarWidget(
            "assets/images/for_splash.png",
            "Clubs",
          ),
          bottomNavigationBarWidget(
            "assets/images/for_splash.png",
            "Courses",
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarWidget(
      String imageURL, String label) {
    return BottomNavigationBarItem(
      backgroundColor: AppColors.white,
      label: label,
      icon: ImageIcon(
        AssetImage(imageURL),
        size: 45,
      ),
    );
  }
}
