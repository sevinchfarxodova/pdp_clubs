import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdp_clubs/constants/colors.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> whys = [
    {
  "image": "assets/images/director_photo.jpg",
  "name": "PDP University",
      "description": "Bu ko’plab IT kompaniyalarni o’z"
  "    ichiga oluvchi PDP Valley ekotizimini "
  "    barpo etishdagi navbatdagi qadam.",
    },

  ];
   HomePage({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // photo and words
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 280,
                  child: Image.asset("assets/images/director_photo.jpg", fit: BoxFit.cover),
                ),
                SizedBox(width: 8),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Founder',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          "If thousands of Uzbek youth around the world are paid not for manual labor, but for their high intellect,"
                              "and if millions of young people improve the financial situation of their families,"
                              "help their loved ones who are struggling abroad return to their homeland,"
                              "and if we can train specialists who make decisions that change the world "
                              " leadership.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      SizedBox(height: 6,),
                      Text(
                        'PDP University director',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Odilbek Mirzayev',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8,),
            Center(
              child: Text("Why PDP University?",
              style: TextStyle(
                fontSize:18,
                color: AppColors.blue
              )),
            ),
            Row(
              children: [

              ],
            )
          ],
        ),
      ),
    );
  }
}
