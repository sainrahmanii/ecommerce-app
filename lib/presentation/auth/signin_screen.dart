import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/common/components/button.dart';
import 'package:flutter_ecommerce_app/common/components/custom_text_field.dart';
import 'package:flutter_ecommerce_app/presentation/auth/register_screen.dart';
import 'package:flutter_ecommerce_app/presentation/home/dashboard_screen.dart';

import '../../common/components/spaces.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SpaceHeight(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: Image.asset(
              Images.logo,
              width: 100,
              height: 100,
            ),
          ),
          const SpaceHeight(height: 24),
          const Center(
            child: Text(
              "SHOES COMMERCE",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorName.dark,
              ),
            ),
          ),
          const SpaceHeight(height: 8),
          const Center(
            child: Text(
              "Signin for continue",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorName.grey,
              ),
            ),
          ),
          const SpaceHeight(height: 40),
          CustomTextField(
            controller: usernameController,
            label: "Username",
          ),
          const SpaceHeight(height: 12),
          CustomTextField(
            controller: passwordController,
            label: "Password",
            obsecureText: true,
          ),
          const SpaceHeight(height: 24),
          Button.filled(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ),
              );
            },
            label: "Sign In",
          ),
          const SpaceHeight(height: 122),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text.rich(
                TextSpan(
                  text: "Haven't an account ?",
                  children: [
                    TextSpan(
                      text: " Register",
                      style: TextStyle(color: ColorName.primary),
                    ),
                  ],
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: ColorName.grey,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
