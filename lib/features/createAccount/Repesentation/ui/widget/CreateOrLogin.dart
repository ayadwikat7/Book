import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../Home/representations/widget/BooksH.dart';
import '../../../../splach1/Data/color.dart';
import '../../../../splach1/repesentation/ui/widgets/ButtonHomeScreen.dart';
import '../../../../splach1/repesentation/ui/widgets/Helper.dart';
import '../../../../Login/represintation/ui/widgets/LoginWith.dart';

class Createorlogin extends StatefulWidget {
  String loginOrSignUp;
  String loginOrSignUpWith;
  String belowMassege;
  String buttonLable;
  final VoidCallback onPressed;
  final VoidCallback onLabelPressed;

  Createorlogin({
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
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Buttonhomescreen(
            BackGround: Appcolor.Pink,
            Textt: Appcolor.white,
            textButton: widget.loginOrSignUp.toString(),
            top: 13,
            bottom: 13,
            left: 16,
            right: 16,
            onPressed: widget.onPressed,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Appcolor.BorderColor,
                ),
              ),
              SizedBox(width: 4),
              Text(
                widget.loginOrSignUpWith.toString(),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(width: 4),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Appcolor.BorderColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
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
                      final AccessToken accessToken = result.accessToken!;
                      print("✅ Facebook Token: ${accessToken.tokenString}");

                      final userData = await FacebookAuth.instance.getUserData();
                      print("🙋‍♂️ User Data: $userData");

                      NavigationHelper.push(context: context, destination: Booksh());
                    } else {
                      print("❌ Facebook Login Failed: ${result.status} - ${result.message}");
                    }
                  } catch (e) {
                    print("🔥 Facebook Login Error: $e");
                  }
                },
              ),
              SizedBox(width: 16),
              // Google Login Button
              Loginwith(
                logo: null,
                Texts: 'Google',
                logoColor: Appcolor.BlueFacbook,
                google: 'assets/images/google.png',
                onTap: () async {
                  try {
                    final GoogleSignInAccount? account = await googleSignIn.signIn();
                    if (account != null) {
                      print("✅ Signed in as: ${account.displayName}, ${account.email}");
                      // يمكن إضافة Firebase Authentication هنا إذا لزم
                      NavigationHelper.push(context: context, destination: Booksh());
                    }
                  } catch (error) {
                    print("❌ Error during Google Sign-in: $error");
                  }
                },
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.belowMassege.toString(),
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(width: 4),
              TextButton(
                onPressed: widget.onLabelPressed,
                child: Text(
                  widget.buttonLable.toString(),
                  style: TextStyle(fontSize: 14, color: Appcolor.Pink),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
