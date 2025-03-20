import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final user = await authService.signInWithGoogle();
            if (user != null) {
              print("Kirish muvaffaqiyatli: ${user.displayName}");
            }
          },
          child: Text("Google bilan kirish"),
        ),
      ),
    );
  }
}
