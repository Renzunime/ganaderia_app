import 'package:flutter/material.dart';
import 'package:ganaderia_app/shared/widgets/priority_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/150?img=32'), // Foto simulada usuario
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Hacienda La Daniela',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Text('Admin: Daniela',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_outlined,
                  color: Colors.black54),
              onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.settings_outlined, color: Colors.black54),
              onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. RESUMEN CLIMÁTICO Y DE PASTOS (Innobovino no te muestra esto al entrar)
            // ¿Por qué es mejor? Porque el ganadero decide qué hacer según el clima.
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.blue[800]!, Colors.blue[600]!]),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4))
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hoy, 24°C ⛅',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Probabilidad lluvia: 10%',
                          style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Row(
                      children: [
                        Icon(Icons.grass, color: Colors.white, size: 16),
                        SizedBox(width: 6),
                        Text('Pastos: Óptimos',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 2. INDICADORES PRODUCTIVOS (KPIs)
            const Text('Pulso del Negocio',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Row(
              children: [
                Expanded(
                    child: _KpiCard(
                        title: 'Producción',
                        value: '850 L',
                        subtitle: '↑ 5% vs ayer',
                        icon: Icons.water_drop,
                        color: Colors.blue)),
                SizedBox(width: 12),
                Expanded(
                    child: _KpiCard(
                        title: 'Ganancia Peso',
                        value: '750g',
                        subtitle: 'Promedio/día',
                        icon: Icons.scale,
                        color: Colors.orange)),
              ],
            ),

            const SizedBox(height: 24),

            // 3. INTELIGENCIA ACTIVA (Tu Diferencial vs Innobovino)
            // Innobovino tiene reportes pasivos. Tú tienes alertas activas.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Prioridades IA',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.red[50],
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text('3 Acciones',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            PriorityCard(
              title: 'Rotación Sugerida',
              description:
                  'El Lote "Novillas" debe salir del Potrero 4 (Pasto bajo). Mover al Potrero 7.',
              icon: Icons.swap_horiz,
              color: Colors.green[700]!,
              actionLabel: 'Autorizar Rotación',
              onTap: () {}, // Aquí abrirías el módulo de potreros
            ),
            PriorityCard(
              title: 'Alerta Sanitaria',
              description:
                  '3 vacas con baja producción repentina. Posible mastitis en Lote 1.',
              icon: Icons.medical_services_outlined,
              color: Colors.red[700]!,
              actionLabel: 'Ver Animales',
              onTap: () {},
            ),

            const SizedBox(height: 80), // Espacio para el botón flotante
          ],
        ),
      ),
      // EL CEREBRO: Botón flotante central de IA
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.black,
        icon: const Icon(Icons.auto_awesome, color: Colors.yellowAccent),
        label:
            const Text('Asistente IA', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;

  const _KpiCard(
      {required this.title,
      required this.value,
      required this.subtitle,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[100]!)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color),
          const SizedBox(height: 12),
          Text(value,
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
          const SizedBox(height: 4),
          Text(subtitle,
              style: TextStyle(
                  color: color, fontSize: 12, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
