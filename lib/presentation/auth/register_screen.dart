import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/common/components/button.dart';
import 'package:flutter_ecommerce_app/common/components/custom_text_field.dart';
import 'package:flutter_ecommerce_app/common/components/spaces.dart';
import 'package:flutter_ecommerce_app/data/models/requests/register_request_model.dart';
import 'package:flutter_ecommerce_app/presentation/auth/signin_screen.dart';

import '../../common/constants/colors.dart';
import '../../common/constants/images.dart';
import 'bloc/register/register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
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
              "Let's Start",
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
              "Create new account",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorName.grey,
              ),
            ),
          ),
          const SpaceHeight(height: 40),
          CustomTextField(
            controller: emailController,
            label: "Email",
          ),
          const SpaceHeight(height: 12),
          CustomTextField(
            controller: nameController,
            label: "Name",
          ),
          const SpaceHeight(height: 12),
          CustomTextField(
            controller: passwordController,
            label: "Password",
            obsecureText: true,
          ),
          const SpaceHeight(height: 12),
          CustomTextField(
            controller: confirmPasswordController,
            label: "Password Confirmation",
            obsecureText: true,
          ),
          const SpaceHeight(height: 24),
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (data) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SigninScreen(),
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Register Successfull !"),
                      backgroundColor: ColorName.green,
                    ),
                  );
                },
                error: (message) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: ColorName.red,
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return Button.filled(
                    onPressed: () {
                      final data = RegisterRequestModel(
                        email: emailController.text,
                        name: nameController.text,
                        password: passwordController.text,
                        username: nameController.text.replaceAll(" ", ""),
                      );
                      context
                          .read<RegisterBloc>()
                          .add(RegisterEvent.register(data));
                    },
                    label: 'Register',
                  );
                },
                loading: () {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
          const SpaceHeight(height: 60),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Text.rich(
                TextSpan(
                  text: "Do you have an account ? ",
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                        color: ColorName.primary,
                      ),
                    )
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
