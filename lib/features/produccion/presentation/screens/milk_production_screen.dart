import 'package:flutter/material.dart';
import 'package:ganaderia_app/features/ganado/presentation/widgets/milk_chart.dart'; // Reusamos tu gráfico

class MilkProductionScreen extends StatelessWidget {
  const MilkProductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Producción de Leche'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        actions: [
          IconButton(icon: const Icon(Icons.history), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {}), // "Exportar Excel"
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. TARJETA DE RESUMEN DEL DÍA
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue[700]!, Colors.blue[500]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.water_drop,
                        color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 20),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ordeño de Hoy',
                          style:
                              TextStyle(color: Colors.white70, fontSize: 14)),
                      Text('850 Litros',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold)),
                      Text('Promedio: 12.5 L/Vaca',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 2. GRÁFICO (Visualmente se ve "Pro")
            const Text('Tendencia (Últimos 7 días)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const SizedBox(
                height: 200, child: MilkChart()), // Tu widget existente

            const SizedBox(height: 30),

            // 3. LISTA DE REGISTROS RECIENTES (Simulando datos)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Registros Individuales',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('Ver Todo')),
              ],
            ),
            const SizedBox(height: 10),
            _MilkEntryCard(
                cowId: '405',
                name: 'Mariposa',
                liters: '18.5',
                time: 'AM',
                status: 'Alta'),
            _MilkEntryCard(
                cowId: '201',
                name: 'Lola',
                liters: '14.2',
                time: 'AM',
                status: 'Media'),
            _MilkEntryCard(
                cowId: '105',
                name: 'Estrella',
                liters: '08.1',
                time: 'AM',
                status: 'Baja',
                isWarning: true),
          ],
        ),
      ),
      // BOTÓN FLOTANTE PRINCIPAL
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.blue[700],
        icon: const Icon(Icons.add),
        label: const Text('Nuevo Ordeño'),
      ),
    );
  }
}

class _MilkEntryCard extends StatelessWidget {
  final String cowId;
  final String name;
  final String liters;
  final String time;
  final String status;
  final bool isWarning;

  const _MilkEntryCard({
    required this.cowId,
    required this.name,
    required this.liters,
    required this.time,
    required this.status,
    this.isWarning = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border:
            isWarning ? Border.all(color: Colors.red.withOpacity(0.3)) : null,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey[100],
            child: Text(cowId.substring(0, 1),
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$name #$cowId',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Ordeño $time',
                    style: TextStyle(color: Colors.grey[500], fontSize: 12)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('$liters L',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              if (isWarning)
                const Text('Bajó 20%',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
