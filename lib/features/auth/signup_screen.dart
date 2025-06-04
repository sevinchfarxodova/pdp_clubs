import 'package:flutter/material.dart';
import 'package:pdp_clubs/core/colors/app_colors.dart';
import 'package:pdp_clubs/core/routes/app_routes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const Text(
              'Create an account',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Amet minim mollit non deserunt ullamco sit aliqua dolor do amet sint.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 32),
            Text(
              'Username',
              style: TextStyle(fontSize: 16, color: AppColors.grey),
            ),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                hintText: 'Enter your username',
                hintStyle: TextStyle(fontSize: 14, color: AppColors.grey),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Email',
              style: TextStyle(fontSize: 16, color: AppColors.grey),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                hintStyle: TextStyle(fontSize: 14, color: AppColors.grey),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Password',
              style: TextStyle(fontSize: 16, color: AppColors.grey),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter your password',
                hintStyle: TextStyle(fontSize: 14, color: AppColors.grey),
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesNames.bottomNavBar);

              },
              child: const Text(
                'SIGN UP',
                style: TextStyle(fontSize: 17, color: AppColors.white),
              ),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text.rich(
                TextSpan(
                  text: 'By tapping "Sign Up" you accept our ',
                  children: [
                    TextSpan(
                      text: 'terms and condition',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(onPressed: (){
              Navigator.pushNamed(context, AppRoutesNames.signIn,);
            }, child: Text("Sign in", style: TextStyle(
              fontSize: 17,
              color: Colors.teal,
              fontWeight: FontWeight.w500,
            ),))
          ],
        ),
      ),
    );
  }
}
