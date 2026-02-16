import 'package:flutter/material.dart';
import 'package:ganaderia_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:ganaderia_app/features/ganado/presentation/screens/ganado_screen.dart';
import 'package:ganaderia_app/features/zootecnista/presentation/screens/zootecnista_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Lista de las pantallas principales
  final List<Widget> _screens = const [
    DashboardScreen(), // Índice 0
    GanadoScreen(), // Índice 1
    ZootecnistaScreen(), // Índice 2
    Center(child: Text('Herramientas')), // Índice 3 (Lo haremos luego)
  ];

  @override
  Widget build(BuildContext context) {
    // Usamos los colores definidos en tu AppTheme automáticamente
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      // IndexedStack mantiene vivas las pantallas en memoria
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        elevation: 3,
        backgroundColor: Colors.white,
        indicatorColor: colors.secondary.withOpacity(0.5),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_outlined),
            selectedIcon: Icon(Icons.dashboard),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.pets_outlined), // Icono perfecto para vacas
            selectedIcon: Icon(Icons.pets),
            label: 'Ganado',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics),
            label: 'Gestión',
          ),
          NavigationDestination(
            icon: Icon(Icons.construction_outlined),
            selectedIcon: Icon(Icons.construction),
            label: 'Tools',
          ),
        ],
      ),
    );
  }
}
