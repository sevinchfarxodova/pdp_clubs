
import 'package:flutter/material.dart';
import 'package:pdp_clubs/core/routes/app_routes.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            const SizedBox(height: 40),
            const Text(
              'Sign In',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
            const SizedBox(height: 8),
            const Text(
              'Amet minim mollit non deserunt ullamco sit aliqua dolor do amet sint.',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 32),
            const Text('Email'),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'Enter your student email'),
            ),
            const SizedBox(height: 20),
            const Text('Password'),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter your password',
                suffixIcon: Icon(Icons.visibility),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {},
              child: const Text('LOGIN'),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Forgot password?'),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Reset here',
                    style: TextStyle(color: Colors.teal),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Center(child: Text("Don't have an account?")),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutesNames.bottomNavBar);
              },
              child:  Text('CREATE AN ACCOUNT', style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
