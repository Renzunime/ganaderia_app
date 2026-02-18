import 'package:flutter/material.dart';
import 'package:ganaderia_app/shared/widgets/priority_card.dart';
import 'package:ganaderia_app/features/ganado/presentation/screens/cow_detail_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar personalizado y limpio
      appBar: AppBar(
        toolbarHeight: 90,
        backgroundColor: Colors.white, // Fondo blanco para limpieza visual
        elevation: 0,
        titleSpacing: 20,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hacienda',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Hola 👋',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        actions: [
          // Botón de perfil o notificaciones (Visual)
          Container(
            margin: const EdgeInsets.only(right: 20),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_outlined,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white, // Todo el fondo blanco
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          // --- SECCIÓN 1: RESUMEN VISUAL (KPIs) ---
          const SizedBox(height: 10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Usamos iconos redondeados y colores distintos para guiar el ojo
              _KpiCard(
                label: 'Total Hato',
                value: '145',
                icon: Icons.grid_view_rounded, // Icono de agrupación
                colorBase: Colors.blueAccent,
              ),
              _KpiCard(
                label: 'Preñadas',
                value: '42',
                icon: Icons.favorite_rounded, // Corazón = Vida/Cría
                colorBase: Colors.pinkAccent,
              ),
              _KpiCard(
                label: 'Litros/Día',
                value: '850',
                icon: Icons.water_drop_rounded, // Gota = Leche
                colorBase: Colors.teal,
              ),
            ],
          ),

          const SizedBox(height: 30),

          // --- SECCIÓN 2: TÍTULO DE SECCIÓN ---
          Row(
            children: [
              const Text(
                'Prioridades Hoy',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  '3 pendientes',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // --- SECCIÓN 3: LISTA DE TARJETAS INTELIGENTES ---

          // TARJETA 1: ALERTA CRÍTICA (Rojo)
          PriorityCard(
            title: 'Secado Inminente',
            description:
                'La Vaca #405 cumple 7 meses de gestación hoy. Iniciar protocolo de secado.',
            icon: Icons.timer_off_outlined, // Icono de "parar tiempo" o "stop"
            color: const Color(0xFFD32F2F), // Rojo Material
            actionLabel: 'Ver Ficha #405',
            onTap: () {
              // NAVEGACIÓN HACIA EL DETALLE
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CowDetailScreen(cowId: '#405'),
                ),
              );
            },
          ),

          // TARJETA 2: ALERTA MEDIA (Naranja)
          PriorityCard(
            title: 'Vacunación Aftosa',
            description:
                'El Lote "Novillas 2" tiene pendiente la vacuna. Vence en 48 horas.',
            icon: Icons.medical_services_outlined,
            color: const Color(0xFFF57C00), // Naranja oscuro
            actionLabel: 'Registrar Lote',
            onTap: () {},
          ),

          // TARJETA 3: SUGERENCIA ZOOTECNISTA (Verde/Azul)
          PriorityCard(
            title: 'Análisis de Pastos',
            description:
                'Humedad baja detectada en Potrero 4. Sugerencia: Aumentar suplemento al 15%.',
            icon: Icons.eco_rounded, // Hoja/Pasto
            color: const Color(0xFF2E7D32), // Verde Bosque
            actionLabel: 'Calcular Ración',
            onTap: () {},
          ),

          const SizedBox(height: 40), // Espacio final
        ],
      ),
    );
  }
}

// --- WIDGET PRIVADO: KPI BUBBLE (Diseño Burbuja) ---
class _KpiCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color colorBase;

  const _KpiCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.colorBase,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 105,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // Bordes MUY curvos (Burbuja)
        boxShadow: [
          BoxShadow(
            color: colorBase.withOpacity(
              0.1,
            ), // La sombra tiene el color del KPI
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.05),
        ), // Borde casi invisible
      ),
      child: Column(
        children: [
          // Icono dentro de círculo de color
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: colorBase.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: colorBase, size: 22),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
