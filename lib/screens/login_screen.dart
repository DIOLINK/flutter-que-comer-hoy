import 'package:flutter/material.dart';
import 'package:que_comer_hoy/services/auth_service.dart';
import 'package:que_comer_hoy/theme/theme.dart';

// ...existing code...
class LoginScreen extends StatelessWidget {
  final AuthService _auth = AuthService();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: beigeColor, // Color crema/beige
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Sección superior (logo y título)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 60), // Espacio superior
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.green[200], // Fondo verde claro
                    child: Icon(
                      Icons.restaurant_menu, // Icono de gorro de chef
                      size: 60,
                      color: Colors.green[800], // Color verde oscuro
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Bienvenido a',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      color: Colors.green[800],
                    ),
                  ),
                  Text(
                    'QueComerHoy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '''Inicia sesión para personalizar tu
experiencia nutricional''',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),

              // Sección inferior (botones)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green[700], // Fondo verde
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    onPressed: () async {
                      print("LoginScreen: Google button pressed");
                      await _auth.signInWithGoogle();
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'G',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Continuar con Google',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ), // Espacio antes del texto "sin cuenta"
                  TextButton(
                    onPressed: () async {
                      final userCredential = await _auth.signInAnonymously();
                      if (userCredential != null &&
                          userCredential.user != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                sandYellow, // Color de fondo personalizado
                            content: Row(
                              children: [
                                const Icon(
                                  Icons.warning_amber_rounded,
                                  color: darkText,
                                ),
                                const SizedBox(width: 12),
                                const Expanded(
                                  child: Text(
                                    'No se pudo iniciar sesión como invitado',
                                    style: TextStyle(
                                      color:
                                          darkText, // Color de texto personalizado
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Continuar sin cuenta',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green[700], // Color verde
                      ),
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
