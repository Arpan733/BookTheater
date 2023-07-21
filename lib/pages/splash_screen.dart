import 'dart:async';

import 'package:booktheater/pages/login_screen.dart';
import 'package:booktheater/utils/mytheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 5000));
    _animation = CurvedAnimation(parent: _animationController, curve: Curves.bounceOut, reverseCurve: Curves.bounceInOut);
    _animationController.forward();

    // Timer(const Duration(milliseconds: 7000), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return Scaffold(
      backgroundColor: Mytheme.splash,
      body: ScaleTransition(
        scale: _animationController,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Logo.png',
                width: 200,
              ),
              const Text(
                "Book Theater",
                style: TextStyle(
                  fontFamily: 'poppins',
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

