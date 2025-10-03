import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:que_comer_hoy/screens/auth_wrapper.dart';
import 'package:que_comer_hoy/theme/theme.dart'; // Importamos nuestro nuevo archivo de temas

import 'firebase_options.dart';

void main() async {
  // Hacer la función main asíncrona
  WidgetsFlutterBinding.ensureInitialized(); // Asegurar que los widgets estén inicializados
  await dotenv.load(fileName: ".env"); // Cargar el archivo .env
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Para quitar la cinta de "Debug"
      title: 'QueComerHoy',
      theme: lightTheme, // Asignamos el tema claro
      darkTheme: darkTheme, // Asignamos el tema oscuro
      themeMode: ThemeMode
          .system, // La app elegirá el tema según la config. del dispositivo
      home: const AuthWrapper(),
    );
  }
}
