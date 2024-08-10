import 'package:booking_show/widgets/custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:pinput/pinput.dart';
import 'dart:ui';

class GlassMorphismLoginScreen extends StatelessWidget {
  const GlassMorphismLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bur.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
          //   child: Container(
          //     color: Colors.black.withOpacity(0),
          //   ),
          // ),
          // Logo
          Positioned(
            top: 40.0,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'images/logo.png',
                width: 190.0,
                height: 190.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const Center(
            child: GlassmorphismLoginForm(),
          ),
        ],
      ),
    );
  }
}

class GlassmorphismLoginForm extends StatelessWidget {
  const GlassmorphismLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 350,
      height: 300,
      borderRadius: 20,
      blur: 8,
      alignment: Alignment.bottomCenter,
      border: 2,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.1),
          const Color(0xFFFFFFFF).withOpacity(0.2),
        ],
      ),
      borderGradient: LinearGradient(
        colors: [
          const Color(0xFFffffff).withOpacity(0.0),
          const Color(0xFFFFFFFF).withOpacity(0.0),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Login to your Account...',
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Inter'),
            ),
            // const SizedBox(height: 20),
            Expanded(
              child: _buildPinputField(),
            ),
            // const SizedBox(height: 10),
            MaterialButtonDesign(
                height: 50, width: 60, text: 'Login', onTap: () {})
          ],
        ),
      ),
    );
  }

  Widget _buildPinputField() {
    return Pinput(
      length: 4,
      onChanged: (value) {},
      defaultPinTheme: PinTheme(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.4),
        ),
        textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter'),
      ),
      focusedPinTheme: PinTheme(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.4),
        ),
        textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter'),
      ),
      submittedPinTheme: PinTheme(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white.withOpacity(0.4),
        ),
        textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter'),
      ),
    );
  }
}
