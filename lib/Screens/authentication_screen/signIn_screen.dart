import 'package:booking_show/Screens/authentication_screen/pin_page.dart';
import 'package:booking_show/Screens/authentication_screen/widgets/background_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import '../../widgets/custom_buttons.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: BackgroundImage(),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
              child: Container(
                color: Colors.black.withOpacity(0),
              ),
            ),
          ),
          // Logo
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Image.asset(
                'images/logo.png',
                width: 190.0,
                height: 190.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // Login form and content
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 160.0),
                      const Text(
                        'Welcome Back!!!',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Inter',
                            color: Colors.white),
                      ),
                      const SizedBox(height: 10.0),
                      const Text(
                        'Sign in to Your Account',
                        style: TextStyle(
                            fontSize: 21.0,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 24.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300]?.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300]?.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: TextFormField(
                              cursorColor: Colors.white,
                              style: const TextStyle(
                                  fontFamily: 'Inter',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      MaterialButtonDesign(
                        height: 50,
                        width: double.infinity,
                        text: 'Sign In',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const GlassMorphismLoginScreen()));
                        },
                      ),
                      const SizedBox(height: 10.0),
                      // GestureDetector(
                      //   onTap: () {
                      //
                      //   },
                      //   child: const Text(
                      //     "Don't have an account? Sign Up",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       decoration: TextDecoration.underline,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 40.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
