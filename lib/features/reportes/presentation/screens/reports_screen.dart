import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Centro de Reportes'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text('Reportes Administrativos',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey)),
          const SizedBox(height: 10),
          _ReportTile(
              icon: Icons.list_alt,
              title: 'Inventario General',
              subtitle: 'Lista completa de animales activos',
              color: Colors.blue),
          _ReportTile(
              icon: Icons.monetization_on_outlined,
              title: 'Balance Financiero',
              subtitle: 'Ingresos vs Gastos del mes',
              color: Colors.green),

          const SizedBox(height: 25),
          const Text('Reportes Técnicos',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.grey)),
          const SizedBox(height: 10),
          _ReportTile(
              icon: Icons.water_drop_outlined,
              title: 'Producción de Leche',
              subtitle: 'Tendencias y promedios',
              color: Colors.lightBlue),
          _ReportTile(
              icon: Icons.medical_services_outlined,
              title: 'Sanidad y Tratamientos',
              subtitle: 'Historial de vacunación',
              color: Colors.redAccent),
          _ReportTile(
              icon: Icons.favorite_border,
              title: 'Reproducción',
              subtitle: 'Tasas de preñez y partos',
              color: Colors.purple),

          const SizedBox(height: 25),
          // Botón de descarga masiva
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!)),
            child: Row(
              children: const [
                Icon(Icons.cloud_download, size: 40, color: Colors.grey),
                SizedBox(width: 15),
                Expanded(
                    child: Text(
                        'Descargar copia de seguridad completa de la finca (Excel)',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ReportTile extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Color color;

  const _ReportTile(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 5)
          ]),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(fontSize: 12)),
        trailing: const Icon(Icons.picture_as_pdf, color: Colors.grey),
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Generando PDF...')));
        },
      ),
    );
  }
}
