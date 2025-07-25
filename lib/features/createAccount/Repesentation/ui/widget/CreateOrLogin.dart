import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;

import '../../../../Home/representations/widget/BooksH.dart';
import '../../../../splach1/Data/color.dart';
import '../../../../splach1/repesentation/ui/widgets/ButtonHomeScreen.dart';
import '../../../../splach1/repesentation/ui/widgets/Helper.dart';
import '../../../../Login/represintation/ui/widgets/LoginWith.dart';
import '../../../Data/google_auth_service.dart';
import 'PinkLoadingIndicator.dart';

class Createorlogin extends StatefulWidget {
  final String loginOrSignUp;
  final String loginOrSignUpWith;
  final String belowMassege;
  final String buttonLable;
  final VoidCallback onPressed;
  final VoidCallback onLabelPressed;

  const Createorlogin({
    super.key,
    required this.loginOrSignUp,
    required this.loginOrSignUpWith,
    required this.belowMassege,
    required this.buttonLable,
    required this.onPressed,
    required this.onLabelPressed,
  });

  @override
  State<Createorlogin> createState() => _CreateorloginState();
}

class _CreateorloginState extends State<Createorlogin> {
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  bool isLoading = false;

  // لعرض الرسائل
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

  Future<void> _handleGoogleSignIn() async {
    setState(() => isLoading = true);
    try {
      final result = await GoogleAuthService().loginWithGoogle();

      if (result['statusCode'] == 200) {
        NavigationHelper.push(context: context, destination: const Booksh());
      } else {
        _showErrorDialog(
          "Error",
          result['data']['message'] ?? "Google login failed",
        );
      }
    } catch (error) {
      _showErrorDialog("Error", "Google Sign-In failed: $error");
    } finally {
      setState(() => isLoading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Buttonhomescreen(
          BackGround: Appcolor.Pink,
          Textt: Appcolor.white,
          textButton: widget.loginOrSignUp,
          top: 13,
          bottom: 13,
          left: 16,
          right: 16,
          onPressed: widget.onPressed,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            const Expanded(
              child: Divider(thickness: 1, color: Appcolor.BorderColor),
            ),
            const SizedBox(width: 4),
            Text(widget.loginOrSignUpWith, style: const TextStyle(fontSize: 12)),
            const SizedBox(width: 4),
            const Expanded(
              child: Divider(thickness: 1, color: Appcolor.BorderColor),
            ),
          ],
        ),
        const SizedBox(height: 16),

        if (isLoading) const Center(child: PinkLoadingIndicator()),

        if (!isLoading)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Facebook Login Button
              Loginwith(
                logo: Icons.facebook,
                Texts: 'Facebook',
                logoColor: Appcolor.BlueFacbook,
                google: '',
                onTap: () async {
                  try {
                    final LoginResult result = await FacebookAuth.instance.login();
                    if (result.status == LoginStatus.success) {
                      final userData = await FacebookAuth.instance.getUserData();
                      print("Facebook User: $userData");
                      NavigationHelper.push(context: context, destination: const Booksh());
                    } else {
                      _showErrorDialog("Error", "Facebook login failed");
                    }
                  } catch (e) {
                    _showErrorDialog("Error", e.toString());
                  }
                },
              ),
              const SizedBox(width: 16),
              // Google Login Button
              Loginwith(
                logo: null,
                Texts: 'Google',
                logoColor: Appcolor.BlueFacbook,
                google: 'assets/images/google.png',
                onTap: _handleGoogleSignIn,
              ),
            ],
          ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.belowMassege, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 4),
            TextButton(
              onPressed: widget.onLabelPressed,
              child: Text(widget.buttonLable, style: const TextStyle(fontSize: 14, color: Appcolor.Pink)),
            ),
          ],
        ),
      ],
    );
  }
}
