import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';



class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
     body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          ///asdfa
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 26,
            ),
            Text(
              'Sign In',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 26,
            ),
            Text(
              'EMAIL',
              style: TextStyle(color: AppColors.blue, fontSize: 12),
            ),
            SizedBox(
              height: 8,
            ),
            Textfields(text: 'Enter Your Email',),
            SizedBox(
              height: 24,
            ),
            Text(
              'PASSWORD',
              style: TextStyle(color: AppColors.blue, fontSize: 12),
            ),
            SizedBox(
              height: 8,
            ),
            Textfields(text: 'Enter Your Password'),
            SizedBox(
              height: 24,
            ),
            Button(
                text: 'Sign in',
                onPressed: () {
                  Navigator.pushNamed(context, "/bottom_nav_bar");
                },
                ),
          ],
        ),
      ),
    );
  }
}
