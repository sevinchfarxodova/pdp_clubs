
import 'package:flutter/material.dart';
import 'package:pdp_clubs/core/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, AppRoutesNames.signUp);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network("https://api.logobank.uz/media/logos_png/PDP_University-01.png"),
      ),
    );
  }
}
