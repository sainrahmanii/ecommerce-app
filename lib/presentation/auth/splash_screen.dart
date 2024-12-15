import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/constants/images.dart';
import 'package:flutter_ecommerce_app/presentation/auth/signin_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(milliseconds: 3000),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SigninScreen(),
        ),
      ),
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          Images.logo,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
