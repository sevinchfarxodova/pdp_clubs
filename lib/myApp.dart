import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/presentation/auth/sign_in.dart';
import 'package:pdp_clubs/src/presentation/home_page/home_page.dart';
import 'package:pdp_clubs/src/presentation/splash_page/splash_page.dart';

import 'bottom_nav_bar.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    //home: SplashPage(),
    initialRoute: "/splash_page",
    routes: {
      "/splash_page":(context)=> SplashPage(),
      "/sign_in":(context)=> SignIn(),
      "/home_page":(context)=> HomePage(),
      "/bottom_nav_bar":(context)=> BottomNavBar(),
    },
  );
  }
}
