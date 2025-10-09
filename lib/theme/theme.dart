import 'package:flutter/material.dart';

// Colores extraídos de la maqueta
const Color primaryGreen = Color(0xFF6E9D79);
const Color lightGreenCard = Color(0xFFE8F5E9);
const Color sandYellow = Color(0xFFDDCB97);
const Color offWhite = Color(0xFFF7F5F2);
const Color darkText = Color(0xFF212121);
const Color beigeColor = Color(0xFFF5F5DC);

// TEMA CLARO
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: primaryGreen,
    onPrimary: Colors.white,
    secondary: sandYellow,
    onSecondary: darkText,
    surface: Colors.white, // Color para las tarjetas y diálogos
    onSurface: darkText,
    error: Colors.redAccent,
    onError: Colors.white,
  ),
  scaffoldBackgroundColor: offWhite,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: darkText),
    titleLarge: TextStyle(color: darkText, fontWeight: FontWeight.bold),
  ),
);

// TEMA OSCURO
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: primaryGreen, // Mantenemos el verde como color principal
    onPrimary: Colors.white,
    secondary: sandYellow,
    onSecondary: darkText,
    surface: const Color(
      0xFF1E1E1E,
    ), // Tarjetas un poco más claras que el fondo
    onSurface: offWhite,
    error: Colors.redAccent,
    onError: Colors.white,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: offWhite),
    titleLarge: TextStyle(color: offWhite, fontWeight: FontWeight.bold),
  ),
);
