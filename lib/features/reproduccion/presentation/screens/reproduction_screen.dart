import 'package:flutter/material.dart';

class ReproductionScreen extends StatelessWidget {
  const ReproductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión Reproductiva'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.grey[50],
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // ALERTAS INMEDIATAS (Lo que Innobovino esconde en reportes)
          const Text('Atención Requerida Hoy',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _StatusCard(
                    count: '3',
                    label: 'Celos Probables',
                    color: Colors.pink,
                    icon: Icons.favorite),
                const SizedBox(width: 15),
                _StatusCard(
                    count: '2',
                    label: 'Palpaciones',
                    color: Colors.orange,
                    icon: Icons.medical_services),
                const SizedBox(width: 15),
                _StatusCard(
                    count: '1',
                    label: 'Parto Inminente',
                    color: Colors.red,
                    icon: Icons.child_friendly),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // CALENDARIO DE EVENTOS (Simulado con lista visual)
          const Text('Eventos Recientes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 15),

          _EventItem(
            date: 'Hoy, 8:00 AM',
            cow: 'Vaca #405 (Lola)',
            event: 'Inseminación Artificial',
            detail: 'Toro: Sansón (Gyr)',
            color: Colors.blue,
          ),
          _EventItem(
            date: 'Ayer, 4:30 PM',
            cow: 'Novilla #202',
            event: 'Celo Detectado',
            detail: 'Monta natural observada',
            color: Colors.pink,
          ),
          _EventItem(
            date: '15 Feb, 10:00 AM',
            cow: 'Vaca #100',
            event: 'Confirmación Preñez',
            detail: '45 días de gestación',
            color: Colors.green,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.pink,
        icon: const Icon(Icons.add),
        label: const Text('Reportar Celo/IA'),
      ),
    );
  }
}

// Widgets auxiliares para esta pantalla
class _StatusCard extends StatelessWidget {
  final String count;
  final String label;
  final Color color;
  final IconData icon;

  const _StatusCard(
      {required this.count,
      required this.label,
      required this.color,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 10),
          Text(count,
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: color)),
          Text(label,
              style: TextStyle(color: color, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class _EventItem extends StatelessWidget {
  final String date;
  final String cow;
  final String event;
  final String detail;
  final Color color;

  const _EventItem(
      {required this.date,
      required this.cow,
      required this.event,
      required this.detail,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: color, width: 4)),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.05), blurRadius: 5)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(event,
                  style: TextStyle(fontWeight: FontWeight.bold, color: color)),
              Text(date,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            ],
          ),
          const SizedBox(height: 5),
          Text(cow,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(detail, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }
}
