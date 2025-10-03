import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:que_comer_hoy/screens/home_screen.dart';
import 'package:que_comer_hoy/screens/login_screen.dart';
import 'package:que_comer_hoy/services/auth_service.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    print("AuthWrapper: Building...");
    return StreamBuilder<User?>(
      stream: AuthService().user,
      builder: (context, snapshot) {
        print("AuthWrapper: StreamBuilder snapshot: ");
        if (snapshot.connectionState == ConnectionState.waiting) {
          print("AuthWrapper: Showing CircularProgressIndicator");
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.hasData) {
          print("AuthWrapper: User logged in, showing HomeScreen");
          return HomeScreen(user: snapshot.data!);
        } else {
          print("AuthWrapper: No user, showing LoginScreen");
          return LoginScreen();
        }
      },
    );
  }
}
