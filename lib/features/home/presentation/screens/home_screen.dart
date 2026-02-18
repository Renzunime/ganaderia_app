import 'package:flutter/material.dart';
import 'package:ganaderia_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:ganaderia_app/features/ganado/presentation/screens/ganado_screen.dart';
import 'package:ganaderia_app/features/zootecnista/presentation/screens/zootecnista_screen.dart';
// Importa las nuevas pantallas
import 'package:ganaderia_app/features/produccion/presentation/screens/milk_production_screen.dart';
import 'package:ganaderia_app/features/reproduccion/presentation/screens/reproduction_screen.dart';
import 'package:ganaderia_app/features/finanzas/presentation/screens/finance_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(), // Index 0
    const GanadoScreen(), // Index 1
    const ZootecnistaScreen(), // Index 2
    const _MoreMenuScreen(), // Index 3: Nuevo menú "Más"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard_outlined),
              activeIcon: Icon(Icons.dashboard),
              label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pets_outlined),
              activeIcon: Icon(Icons.pets),
              label: 'Ganado'),
          BottomNavigationBarItem(
              icon: Icon(Icons.science_outlined),
              activeIcon: Icon(Icons.science),
              label: 'Zootecnista'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              activeIcon: Icon(Icons.grid_view_rounded),
              label: 'Menú'),
        ],
      ),
    );
  }
}

// Pantalla interna de Menú para acceder a los nuevos módulos
class _MoreMenuScreen extends StatelessWidget {
  const _MoreMenuScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Menú Principal'),
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Gestión Operativa',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(height: 10),
          _MenuTile(
            icon: Icons.water_drop,
            color: Colors.blue,
            title: 'Producción de Leche',
            subtitle: 'Registros diarios y curvas',
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const MilkProductionScreen())),
          ),
          _MenuTile(
            icon: Icons.favorite,
            color: Colors.pink,
            title: 'Reproducción',
            subtitle: 'Celos, IA y Partos',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const ReproductionScreen())),
          ),
          _MenuTile(
            icon: Icons.scale,
            color: Colors.orange,
            title: 'Pesaje y Carne',
            subtitle: 'Control de engorde',
            onTap: () {}, // Pendiente o usar pantalla genérica
          ),
          const SizedBox(height: 30),
          const Text('Administración',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey)),
          const SizedBox(height: 10),
          _MenuTile(
            icon: Icons.monetization_on,
            color: Colors.green[800]!,
            title: 'Finanzas',
            subtitle: 'Gastos vs Ingresos',
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (_) => const FinanceScreen())),
          ),
          _MenuTile(
            icon: Icons.people,
            color: Colors.purple,
            title: 'Personal',
            subtitle: 'Vaqueros y permisos',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _MenuTile(
      {required this.icon,
      required this.color,
      required this.title,
      required this.subtitle,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}
