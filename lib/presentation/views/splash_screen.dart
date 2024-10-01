import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movies_application/presentation/views/bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'SplashScreen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          // تأكد من أن الـ widget ما زال موجودًا
          Navigator.pushReplacementNamed(context, BottomNavBar.routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(color: Colors.black),
          child: Center(child: Image.asset('assets/images/logo.png'))),
    );
  }
}
