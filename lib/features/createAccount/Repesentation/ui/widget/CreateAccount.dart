import 'package:flutter/material.dart';
import '../../../../Home/representations/widget/BooksH.dart';
import '../../../../splach1/Data/color.dart';
import '../../../../splach1/repesentation/ui/widgets/Helper.dart';
import '../../../../Login/represintation/ui/widgets/LoginScreen.dart';
import '../../../../Login/represintation/ui/widgets/TextFildeLogin.dart';
import '../../../Data/RegisterService.dart';
import 'CreateOrLogin.dart';
import '../../../../Login/represintation/ui/widgets/titleAppBar.dart';
import 'PinkLoadingIndicator.dart';

class Createaccount extends StatefulWidget {
  const Createaccount({super.key});

  @override
  State<Createaccount> createState() => _CreateaccountState();
}

class _CreateaccountState extends State<Createaccount> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool agree = false;
  bool triedToSubmit = false;
  bool isLoading = false;

  Future<void> _register() async {
    setState(() => isLoading = true);
    final authService = AuthService();

    try {
      final result = await authService.registerUser(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
      );

      setState(() => isLoading = false);
      final statusCode = result['statusCode'];
      final data = result['data'];

      if (statusCode == 201) {
        // نجاح التسجيل
        final message = data['message'] ?? "Registered successfully! Please verify your email.";
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );

        // الانتقال إلى صفحة تسجيل الدخول
        Future.delayed(const Duration(seconds: 2), () {
          NavigationHelper.pushReplacement(
            context: context,
            destination: const Loginscreen(),
          );
        });
      } else {
        // عرض الأخطاء القادمة من السيرفر
        String errorMsg = data['message'] ?? "Registration failed";
        if (data['errors'] != null) {
          data['errors'].forEach((key, value) {
            errorMsg += "\n- ${value.join(', ')}";
          });
        }
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => NavigationHelper.pop(context),
          icon: const Icon(Icons.navigate_before, size: 22),
        ),
        title: Titleappbar(title: "Create account"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Name
                Textfildelogin(
                  lable: "Name",
                  hint: 'John Smith',
                  ic: null,
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Name is required';
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // Email
                Textfildelogin(
                  lable: "Email",
                  hint: 'example@gmail.com',
                  ic: null,
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Email is required';
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
                      return 'Enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // Password
                Textfildelogin(
                  lable: "Password",
                  hint: '*******',
                  ic: Icons.visibility,
                  controller: passwordController,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Password is required';
                    if (value.length < 6) return 'Password must be at least 6 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 14),

                // Confirm password
                Textfildelogin(
                  lable: "Confirm password",
                  hint: '*******',
                  ic: Icons.visibility,
                  controller: confirmPasswordController,
                  isPassword: true,
                  validator: (value) {
                    if (value != passwordController.text) return 'Passwords do not match';
                    return null;
                  },
                ),

                // Terms & conditions
                Row(
                  children: [
                    Checkbox(
                      value: agree,
                      onChanged: (value) {
                        setState(() => agree = value!);
                      },
                    ),
                    const Text("Agree With", style: TextStyle(fontSize: 12)),
                    const SizedBox(width: 4),
                    const Text("Terms & Conditions",
                        style: TextStyle(fontSize: 12, color: Appcolor.Pink)),
                  ],
                ),
                if (!agree && triedToSubmit)
                  const Padding(
                    padding: EdgeInsets.only(left: 8, top: 4),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'You must agree to the terms and conditions.',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  ),
                const SizedBox(height: 14),
                if (isLoading)
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: PinkLoadingIndicator(),
                  ),
                // Submit button
                Createorlogin(
                  loginOrSignUp: 'Create account',
                  belowMassege: 'Already have an account?',
                  buttonLable: 'Login',
                  loginOrSignUpWith: 'Or sign in with',
                  onPressed: () {
                    final isValid = _formKey.currentState!.validate();
                    setState(() => triedToSubmit = true);
                    if (isValid && agree && !isLoading) {
                      _register();
                    }
                  },
                  onLabelPressed: () {
                    NavigationHelper.push(context: context, destination: const Loginscreen());
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
