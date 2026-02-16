import 'package:flutter/material.dart';
import 'package:ganaderia_app/features/zootecnista/presentation/screens/ration_calculator_screen.dart';
import 'package:ganaderia_app/features/zootecnista/presentation/screens/pregnancy_calculator_screen.dart';
// Importamos la pantalla comodín
import 'package:ganaderia_app/shared/widgets/feature_preview_screen.dart';

class ZootecnistaScreen extends StatelessWidget {
  const ZootecnistaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Centro de Gestión',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Herramientas Inteligentes',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),

            // BARRA DE BÚSQUEDA
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.green),
                  hintText: 'Buscar herramienta...',
                  border: InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // --- GRILLA COMPLETA (Cubriendo funciones de Innobovino) ---
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.9, // Hace las tarjetas un poco más altas
                children: [
                  // 1. CALCULADORA (REAL)
                  _ToolCard(
                    title: 'Calculadora\nde Ración',
                    icon: Icons.scale_outlined,
                    color: Colors.green,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RationCalculatorScreen(),
                      ),
                    ),
                  ),

                  // 2. PARTO (REAL)
                  _ToolCard(
                    title: 'Proyección\nde Parto',
                    icon: Icons.calendar_month_outlined,
                    color: Colors.purple,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PregnancyCalculatorScreen(),
                      ),
                    ),
                  ),

                  // 3. FINANZAS (NUEVO - DEMO)
                  _ToolCard(
                    title: 'Finanzas &\nCostos',
                    icon: Icons.attach_money,
                    color: Colors.blue,
                    onTap: () => _goToPreview(
                      context,
                      'Finanzas',
                      'Control total de gastos en alimentos, medicinas y venta de leche. Calcula tu rentabilidad exacta.',
                      Icons.pie_chart,
                      Colors.blue,
                    ),
                  ),

                  // 4. GENEALOGÍA (NUEVO - DEMO)
                  _ToolCard(
                    title: 'Árbol\nGenealógico',
                    icon: Icons.account_tree_outlined,
                    color: Colors.brown,
                    onTap: () => _goToPreview(
                      context,
                      'Genealogía',
                      'Visualiza padres, abuelos y descendencia para evitar consanguinidad y mejorar la genética.',
                      Icons.account_tree,
                      Colors.brown,
                    ),
                  ),

                  // 5. ORDEÑO DIARIO (NUEVO - DEMO)
                  _ToolCard(
                    title: 'Registro de\nOrdeño',
                    icon: Icons.water_drop_outlined,
                    color: Colors.lightBlue,
                    onTap: () => _goToPreview(
                      context,
                      'Tanque de Leche',
                      'Registro diario de litros totales, calidad de leche y precios de venta actuales.',
                      Icons.water_drop,
                      Colors.lightBlue,
                    ),
                  ),

                  // 6. REPORTES (NUEVO - DEMO)
                  _ToolCard(
                    title: 'Reportes\nPDF/Excel',
                    icon: Icons.picture_as_pdf_outlined,
                    color: Colors.redAccent,
                    onTap: () => _goToPreview(
                      context,
                      'Centro de Reportes',
                      'Descarga listados de vacunación, inventarios y cierres de mes para compartir por WhatsApp.',
                      Icons.file_download,
                      Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper para navegar a la demo
  void _goToPreview(
    BuildContext context,
    String title,
    String desc,
    IconData icon,
    Color color,
  ) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => FeaturePreviewScreen(
          title: title,
          description: desc,
          icon: icon,
          color: color,
        ),
      ),
    );
  }
}

// --- WIDGET TARJETA (Sin cambios, solo reusado) ---
class _ToolCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _ToolCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.onTap,
  });

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
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(color: color.withOpacity(0.1), width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 28, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
