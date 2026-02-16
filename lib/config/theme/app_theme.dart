import 'package:flutter/material.dart';

class AppTheme {
  // Colores Corporativos (Inspirados en campo y tecnología)
  static const Color primary = Color(0xFF2E7D32); // Verde Bosque (Confianza)
  static const Color secondary = Color(0xFF81C784); // Verde Claro
  static const Color background = Color(0xFFF5F5F5); // Gris muy claro (Limpio)
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFD32F2F); // Rojo Alerta
  static const Color warning = Color(0xFFFFA000); // Ambar (Atención)

  static ThemeData getLight() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        background: background,
        surface: surface,
        error: error,
      ),
      scaffoldBackgroundColor: background,
      // Estilo de Tarjetas (Elevadas y limpias)
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        color: surface,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      // Botones grandes para dedos de trabajador
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: primary,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
