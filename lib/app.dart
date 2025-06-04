import 'package:flutter/material.dart';

import 'core/routes/app_routes.dart';
import 'core/routes/route_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.generateRoute,
      initialRoute: AppRoutesNames.bottomNavBar,

    );
  }
}