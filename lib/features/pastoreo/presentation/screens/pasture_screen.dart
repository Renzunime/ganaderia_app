import 'package:flutter/material.dart';

class PastureScreen extends StatelessWidget {
  const PastureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Mis Potreros'),
          actions: [IconButton(icon: const Icon(Icons.map), onPressed: () {})]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // RESUMEN DE AFORO (Innobovino Feature)
          // Mostramos la comida disponible visualmente
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            color: Colors.green[50],
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.grass, size: 40, color: Colors.green),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Disponibilidad Total',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('45 Días de comida',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.green,
                              fontWeight: FontWeight.w900)),
                      Text('Para carga actual (145 animales)',
                          style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          const Text('Estado de Lotes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          // GRID DE POTREROS (VISUAL)
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.1,
            children: [
              _PastureCard(
                name: 'Potrero 1 (La Loma)',
                status: 'Ocupado',
                daysLeft: '2 días restantes',
                animals: 'Lote Novillas (45)',
                color: Colors.red[100]!,
                textColor: Colors.red[900]!,
              ),
              _PastureCard(
                name: 'Potrero 2 (El Río)',
                status: 'En Descanso',
                daysLeft: 'Listo en 5 días',
                animals: 'Vacío',
                color: Colors.orange[100]!,
                textColor: Colors.orange[900]!,
              ),
              _PastureCard(
                name: 'Potrero 3 (Casa)',
                status: 'Listo',
                daysLeft: '100% Recuperado',
                animals: 'Disponible',
                color: Colors.green[100]!,
                textColor: Colors.green[900]!,
                isReady: true,
              ),
              _AddPastureCard(),
            ],
          ),
        ],
      ),
    );
  }
}

class _PastureCard extends StatelessWidget {
  final String name;
  final String status;
  final String daysLeft;
  final String animals;
  final Color color;
  final Color textColor;
  final bool isReady;

  const _PastureCard(
      {required this.name,
      required this.status,
      required this.daysLeft,
      required this.animals,
      required this.color,
      required this.textColor,
      this.isReady = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: isReady ? Border.all(color: Colors.green, width: 2) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: textColor),
                      overflow: TextOverflow.ellipsis)),
              if (isReady)
                const Icon(Icons.check_circle, color: Colors.green, size: 18)
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(status,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: textColor)),
              const SizedBox(height: 4),
              Text(animals,
                  style: TextStyle(
                      fontSize: 12, color: textColor.withOpacity(0.8))),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8)),
            child: Text(daysLeft,
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: textColor)),
          ),
        ],
      ),
    );
  }
}

class _AddPastureCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[400]!, style: BorderStyle.solid),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_circle_outline, size: 30, color: Colors.grey),
            Text('Crear Potrero', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
