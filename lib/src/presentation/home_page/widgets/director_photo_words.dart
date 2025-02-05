import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DirectorPhotoWords extends StatelessWidget {
  const DirectorPhotoWords({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          width: 200,
          height: 265,
          child: Image.asset("assets/images/director_photo.jpg",
              fit: BoxFit.cover),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Center(
                child: Text(
                  'Founder',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
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
              SizedBox(height: 6),
              Text(
                'Director',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'Odilbek Mirzayev',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
