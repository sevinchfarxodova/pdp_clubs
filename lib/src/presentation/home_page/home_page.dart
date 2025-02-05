import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp_clubs/constants/colors.dart';
import 'package:pdp_clubs/src/presentation/home_page/widgets/director_photo_words.dart';
import 'package:pdp_clubs/src/presentation/home_page/widgets/whys.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Image.asset("assets/images/splash_logo.webp"),
          ),
        ),
        title: const Text(
          "PDP University",
          style: TextStyle(color: AppColors.blue),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.menu_outlined),
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Photo and words
              DirectorPhotoWords(),
              SizedBox(height: 10),
              Center(
                child: Text(
                  "Why PDP University?",
                  style: TextStyle(fontSize: 18, color: AppColors.blue),
                ),
              ),
              SizedBox(height: 6,),
              Whys(),
            ],
          ),
        ),
      ),
    );
  }
}
