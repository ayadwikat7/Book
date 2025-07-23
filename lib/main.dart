import 'package:flutter/material.dart';

import 'features/Book/represintations/widget/BookDetails.dart';
import 'features/Home/representations/widget/BooksH.dart';
import 'features/createAccount/Repesentation/ui/widget/CreateAccount.dart';
import 'features/Login/represintation/ui/widgets/LoginScreen.dart';
import 'features/Login/represintation/ui/widgets/PasswordChanged.dart' show Passwordchanged;
import 'features/Login/represintation/ui/widgets/ResetPassword.dart';
import 'features/Login/represintation/ui/widgets/enterCode.dart';
import 'features/Login/represintation/ui/widgets/forgetPass.dart';
import 'features/spalsh2/repesentation/ui/widgets/splash2HomeScreen.dart';
import 'features/splach1/repesentation/ui/widgets/splashBook.dart';

void main() {
  runApp(const Book());
}

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Booksh(),
    );
  }
}
