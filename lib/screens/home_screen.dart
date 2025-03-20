import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text("Chorva Bozor")),
      body: Center(
        child: user == null
            ? Text("Foydalanuvchi ma’lumotlari yo‘q")
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            user.photoURL != null
                ? CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL ?? ""),
              radius: 40,
            )
                : Icon(Icons.account_circle, size: 80),
            SizedBox(height: 10),
            Text("Ism: ${user.displayName ?? 'Noma’lum'}"),
            Text("Email: ${user.email ?? 'Email yo‘q'}"),
            Text("Telefon: ${user.phoneNumber ?? 'Telefon yo‘q'}"),
          ],
        ),
      ),
    );
  }
}
