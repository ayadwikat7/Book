import 'dart:convert';
import 'package:books/features/Login/represintation/ui/widgets/titleAppBar.dart';
import 'package:books/features/splach1/Data/color.dart';
import 'package:flutter/material.dart';

import '../../../../Home/representations/widget/BooksH.dart';
import '../../../../createAccount/Data/RegisterService.dart';
import '../../../../createAccount/Repesentation/ui/widget/PinkLoadingIndicator.dart';
import '../../../../splach1/repesentation/ui/widgets/Helper.dart';
import '../../../../createAccount/Repesentation/ui/widget/CreateAccount.dart';
import '../../../../createAccount/Repesentation/ui/widget/CreateOrLogin.dart';
import 'LoginWith.dart';
import 'TextFildeLogin.dart';
import 'forgetPass.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  final AuthService _authService = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() => isLoading = true);
    try {
      final result = await _authService.loginUser(
        email: emailController.text,
        password: passwordController.text,
      );

      setState(() => isLoading = false);

      if (result['statusCode'] == 200) {
        final message = result['data']['message'] ?? "Login successful";
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

        // احفظ التوكن لو احتجته
        final token = result['data']['token'] ?? "";
        print("==> Token: $token");

        // التنقل للصفحة الرئيسية
        NavigationHelper.push(context: context, destination: const Booksh());
      } else {
        final errorMsg = result['data']['message'] ?? "Login failed";
        _showErrorDialog("Error", errorMsg);
      }
    } catch (e) {
      setState(() => isLoading = false);
      _showErrorDialog("Connection Error", e.toString());
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.packGround,
      appBar: AppBar(
        backgroundColor: Appcolor.packGround,
        leading: IconButton(
          onPressed: () {
            NavigationHelper.pop(context);
          },
          icon: const Icon(Icons.navigate_before, size: 22),
        ),
        title: Titleappbar(title: "Log in"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Textfildelogin(
                  lable: "Email",
                  hint: 'Example@gmail.com',
                  ic: null,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Textfildelogin(
                  lable: "Password",
                  hint: '********',
                  ic: Icons.visibility,
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                if (isLoading)
                  const Center(
                    child: PinkLoadingIndicator(),
                  ),
                const SizedBox(height: 16),
                Createorlogin(
                  loginOrSignUp: 'Log in',
                  loginOrSignUpWith: 'Or log in with',
                  belowMassege: 'Don’t have an account?',
                  buttonLable: 'Sign up',
                  onPressed: () {
                    if (_formKey.currentState!.validate() && !isLoading) {
                      _login();
                    }
                  },
                  onLabelPressed: () {
                    NavigationHelper.push(context: context, destination: const Createaccount());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
