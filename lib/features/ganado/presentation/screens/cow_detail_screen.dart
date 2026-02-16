import 'package:flutter/material.dart';
import 'package:ganaderia_app/features/ganado/presentation/widgets/milk_chart.dart';
import 'package:ganaderia_app/features/ganado/presentation/widgets/health_timeline.dart';
import 'package:ganaderia_app/features/ganado/presentation/widgets/quick_action_modal.dart'; // <--- IMPORTANTE

class CowDetailScreen extends StatelessWidget {
  final String cowId;

  const CowDetailScreen({super.key, required this.cowId});

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // 1. CABECERA
          SliverAppBar(
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            backgroundColor: primaryColor,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Vaca $cowId (Lola)'),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(color: Colors.grey[300]),
                  const Center(
                    child: Icon(
                      Icons.add_a_photo,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black54],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 2. CONTENIDO
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // A: CICLO VITAL
                    const Text(
                      'Ciclo Productivo Actual',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const _LifeCycleTimeline(currentStage: 2),
                    const SizedBox(height: 30),

                    // B: DATOS CLAVE
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _InfoItem(label: 'Edad', value: '4 Años'),
                        _InfoItem(label: 'Peso', value: '450 Kg'),
                        _InfoItem(label: 'Raza', value: 'Brahman'),
                      ],
                    ),
                    const Divider(height: 40),

                    // C: ACCIONES RÁPIDAS (CONECTADAS)
                    const Text(
                      'Acciones Rápidas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        // BOTÓN ORDEÑO
                        Expanded(
                          child: _ActionButton(
                            icon: Icons.water_drop,
                            label: 'Ordeño',
                            color: Colors.blue,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => QuickActionModal(
                                  actionType: 'Ordeño',
                                  cowId: cowId,
                                  color: Colors.blue,
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        // BOTÓN PESO
                        Expanded(
                          child: _ActionButton(
                            icon: Icons.monitor_weight,
                            label: 'Pesar',
                            color: Colors.orange,
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                builder: (context) => QuickActionModal(
                                  actionType: 'Peso',
                                  cowId: cowId,
                                  color: Colors.orange,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                    const Divider(),
                    const SizedBox(height: 20),

                    // D: GRÁFICOS (LECHE Y SALUD)
                    const Text(
                      'Producción de Leche',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const MilkChart(),

                    const SizedBox(height: 30),

                    const HealthTimeline(),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

// --- WIDGETS PRIVADOS ---
class _LifeCycleTimeline extends StatelessWidget {
  final int currentStage;
  const _LifeCycleTimeline({required this.currentStage});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StageDot(label: 'Cría', index: 0, currentIndex: currentStage),
          _Line(isActive: currentStage > 0),
          _StageDot(label: 'Novilla', index: 1, currentIndex: currentStage),
          _Line(isActive: currentStage > 1),
          _StageDot(label: 'Preñada', index: 2, currentIndex: currentStage),
          _Line(isActive: currentStage > 2),
          _StageDot(label: 'Seca', index: 3, currentIndex: currentStage),
        ],
      ),
    );
  }
}

class _StageDot extends StatelessWidget {
  final String label;
  final int index;
  final int currentIndex;
  const _StageDot({
    required this.label,
    required this.index,
    required this.currentIndex,
  });
  @override
  Widget build(BuildContext context) {
    bool isActive = index <= currentIndex;
    bool isCurrent = index == currentIndex;
    return Column(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor: isActive
              ? (isCurrent ? Colors.green : Colors.green[200])
              : Colors.grey[300],
          child: isCurrent
              ? const Icon(Icons.check, size: 14, color: Colors.white)
              : null,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
            color: isCurrent ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _Line extends StatelessWidget {
  final bool isActive;
  const _Line({required this.isActive});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        color: isActive ? Colors.green[200] : Colors.grey[300],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  const _InfoItem({required this.label, required this.value});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap; // Nueva propiedad

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Cambiado a InkWell
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
