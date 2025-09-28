import 'package:flutter/material.dart';
import 'package:que_comer_hoy/services/auth_service.dart';

class LoginScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Sección superior (logo y título)
              const Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 60), // Espacio superior
                  Icon(
                    Icons.restaurant_menu,
                    size: 100,
                    color: Colors.black87,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Qué Comer Hoy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),

              // Sección inferior (botón)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      backgroundColor: Colors.grey[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () async {
                      await _auth.signInWithGoogle();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Aquí podríamos un logo de Google si lo tuviéramos en los assets
                        // Por ahora, usamos un texto simple.
                        Text(
                          'G', 
                          style: TextStyle(
                            fontSize: 24, 
                            fontWeight: FontWeight.bold, 
                            color: Colors.blue
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Iniciar sesión con Google',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40), // Espacio inferior
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}