import 'package:flutter/material.dart';
import 'package:pdp_clubs/features/auth/signin_screen.dart';
import 'package:pdp_clubs/features/auth/signup_screen.dart';
import 'package:pdp_clubs/features/auth/splash_screen.dart';
import 'package:pdp_clubs/features/clubs/clubs_page.dart';
import 'package:pdp_clubs/features/clubs/clubs_page_with%20_search.dart';
import 'package:pdp_clubs/features/profile/pages/profile_page.dart';
import '../../bottom_nav_bar.dart';
import 'app_routes.dart';

class AppRoutes {
  static final AppRoutes _instance = AppRoutes._init();

  static AppRoutes get instance => _instance;

  AppRoutes._init();

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesNames.signIn:
        return MaterialPageRoute(builder: (context) => SignInScreen());

      case AppRoutesNames.signUp:
        return MaterialPageRoute(builder: (context) => SignUpScreen());

      case AppRoutesNames.bottomNavBar:
        return MaterialPageRoute(builder: (context) => BottomNavBar());

      case AppRoutesNames.profile:
        return MaterialPageRoute(builder: (context) => ProfilePage());

      case AppRoutesNames.clubsPage:
        return MaterialPageRoute(builder: (context) => ClubsPageSearch());

      case AppRoutesNames.clubsCategory:
        final String category = settings.arguments as String? ?? 'Sports Clubs';
        return MaterialPageRoute(
          builder: (context) => ClubsPage(category: category),
        );

      case AppRoutesNames.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      default:
        return MaterialPageRoute(builder: (context) => ProfilePage());
    }
  }
}
