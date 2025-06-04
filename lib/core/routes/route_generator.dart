import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp_clubs/features/profile/pages/profile_page.dart';
import '../../bottom_nav_bar.dart';
import 'app_routes.dart';

class AppRoutes {
  static final AppRoutes _instance = AppRoutes._init();

  static AppRoutes get instance => _instance;

  AppRoutes._init();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {

       case AppRoutesNames.bottomNavBar:
         return MaterialPageRoute(builder: (context) => BottomNavBar());

      case AppRoutesNames.profile:
        return MaterialPageRoute(builder: (context) => ProfilePage());




      default:
        return MaterialPageRoute(builder: (context) => ProfilePage());
    }
  }
}
