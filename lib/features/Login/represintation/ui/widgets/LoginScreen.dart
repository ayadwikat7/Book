import 'package:books/features/Login/represintation/ui/widgets/titleAppBar.dart';
import 'package:books/features/splach1/Data/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Home/representations/widget/BooksH.dart';
import '../../../../splach1/repesentation/ui/widgets/ButtonHomeScreen.dart';
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
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
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    const SizedBox(width: 5),
                    const Text(
                      "Remember me",
                      style: TextStyle(fontSize: 12),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        NavigationHelper.push(context: context, destination: forgetPass());
                      },
                      child: const Text(
                        "Forget your password?",
                        style: TextStyle(fontSize: 12, color: Appcolor.Pink),
                      ),
                    ),
                  ],
                ),
                Createorlogin(
                  loginOrSignUp: 'Log in',
                  loginOrSignUpWith: 'Or log in with',
                  belowMassege: 'Don’t have an account?',
                  buttonLable: 'Sign up',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      NavigationHelper.push(context: context, destination: Booksh());
                    }

                  },
                  onLabelPressed: () {
                    NavigationHelper.push(context: context, destination: Createaccount());
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
