import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:que_comer_hoy/screens/home_screen.dart';
import 'package:que_comer_hoy/screens/login_screen.dart';
import 'package:que_comer_hoy/services/auth_service.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService().user,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasData) {
          return HomeScreen(user: snapshot.data!);
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
