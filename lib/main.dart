import 'package:flutter/material.dart';
import 'package:ganaderia_app/config/theme/app_theme.dart';
import 'package:ganaderia_app/features/home/presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

// ... imports ...

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ganadería Pro',
      theme: AppTheme.getLight(),
      home: const HomeScreen(), // <--- AQUÍ EL CAMBIO
    );
  }
}
