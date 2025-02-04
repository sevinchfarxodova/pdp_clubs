import 'package:flutter/material.dart';
import 'package:pdp_clubs/src/presentation/auth/widgets/button.dart';
import 'package:pdp_clubs/src/presentation/auth/widgets/text_fields.dart';

import '../../../constants/colors.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          ///asdfaj
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 26,
            ),
            const Text(
              'Sign In',
              style: TextStyle(
                  color: AppColors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 26,
            ),
            const Text(
              'EMAIL',
              style: TextStyle(color: AppColors.blue, fontSize: 12),
            ),
            const SizedBox(
              height: 8,
            ),
            Textfields(
              text: 'Enter Your Email',
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'PASSWORD',
              style: TextStyle(color: AppColors.blue, fontSize: 12),
            ),
            const SizedBox(
              height: 8,
            ),
            Textfields(text: 'Enter Your Password'),
            const SizedBox(
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
