import 'package:flutter/material.dart';
// IMPORTAMOS TODAS LAS PANTALLAS REALES QUE YA CREAMOS
import 'package:ganaderia_app/features/finanzas/presentation/screens/finance_screen.dart';
import 'package:ganaderia_app/features/produccion/presentation/screens/milk_production_screen.dart';
import 'package:ganaderia_app/features/reproduccion/presentation/screens/reproduction_screen.dart';
import 'package:ganaderia_app/features/reportes/presentation/screens/reports_screen.dart'; // <--- Nueva
import 'package:ganaderia_app/features/zootecnista/presentation/screens/ration_calculator_screen.dart';
import 'package:ganaderia_app/features/zootecnista/presentation/screens/pregnancy_calculator_screen.dart';
// Para lo que falte (Genealogía) usamos el preview
import 'package:ganaderia_app/shared/widgets/feature_preview_screen.dart';

class ZootecnistaScreen extends StatelessWidget {
  const ZootecnistaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Gestión de Finca',
            style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SECCIÓN 1: LOS PILARES (Igual que Innobovino)
            const Text('Módulos Principales',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            GridView.count(
              shrinkWrap: true, // Importante para que funcione dentro de Column
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              childAspectRatio: 1.1,
              children: [
                _ManagementCard(
                  title: 'Producción\nde Leche',
                  icon: Icons.water_drop,
                  color: Colors.blue,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const MilkProductionScreen())),
                ),
                _ManagementCard(
                  title: 'Finanzas\ny Costos',
                  icon: Icons.attach_money,
                  color: Colors.green,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const FinanceScreen())),
                ),
                _ManagementCard(
                  title: 'Calendario\nReproductivo',
                  icon: Icons.calendar_month,
                  color: Colors.purple,
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ReproductionScreen())),
                ),
                _ManagementCard(
                  title: 'Reportes\ny Exportar',
                  icon: Icons.bar_chart,
                  color: Colors.orange,
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ReportsScreen())),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // SECCIÓN 2: HERRAMIENTAS TÉCNICAS (Lo que antes era "Zootecnista")
            const Text('Herramientas Técnicas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),

            // Lista horizontal para herramientas específicas
            SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _ToolMiniCard(
                    title: 'Calculadora\nRación',
                    icon: Icons.scale_outlined,
                    color: Colors.teal,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RationCalculatorScreen())),
                  ),
                  _ToolMiniCard(
                    title: 'Proyección\nParto',
                    icon: Icons.baby_changing_station,
                    color: Colors.pinkAccent,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PregnancyCalculatorScreen())),
                  ),
                  _ToolMiniCard(
                    title: 'Árbol\nGenealógico',
                    icon: Icons.account_tree,
                    color: Colors.brown,
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => FeaturePreviewScreen(
                                title: 'Genealogía',
                                description: 'Rastreo de padres y abuelos.',
                                icon: Icons.account_tree,
                                color: Colors.brown))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// TARJETA GRANDE (Módulos Principales)
class _ManagementCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ManagementCard(
      {required this.title,
      required this.icon,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: color.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(icon, size: 35, color: color),
            ),
            const SizedBox(height: 10),
            Text(title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

// TARJETA PEQUEÑA (Herramientas)
class _ToolMiniCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ToolMiniCard(
      {required this.title,
      required this.icon,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      margin: const EdgeInsets.only(right: 15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: color, size: 28),
              const SizedBox(height: 8),
              Text(title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold, color: color)),
            ],
          ),
        ),
      ),
    );
  }
}
