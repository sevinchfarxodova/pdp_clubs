import 'dart:async';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    Timer( Duration(seconds: 3),(){
      Navigator.pushNamed(context, "/sign_in");
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Image.asset("assets/images/for_splash.png"),
      ),
    );
  }
}
