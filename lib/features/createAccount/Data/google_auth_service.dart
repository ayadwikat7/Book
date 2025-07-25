import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class GoogleAuthService {
  static const String baseUrl = "http://192.168.1.14:8000/api";

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<Map<String, dynamic>> loginWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        return {"statusCode": 400, "message": "Google sign-in canceled"};
      }

      final auth = await account.authentication;
      final idToken = auth.idToken;

      final url = Uri.parse('$baseUrl/google-login');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json', 'Accept': 'application/json'},
        body: jsonEncode({"id_token": idToken}),
      );

      final data = jsonDecode(response.body);
      return {"statusCode": response.statusCode, "data": data};
    } catch (e) {
      return {"statusCode": 500, "data": {"message": "Google login error: $e"}};
    }
  }
}
