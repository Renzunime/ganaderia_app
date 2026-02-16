import 'package:flutter/material.dart';

class HealthTimeline extends StatelessWidget {
  const HealthTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Historial Sanitario',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        _HealthEvent(
          date: '15 Feb 2026',
          title: 'Vacuna Aftosa',
          type: 'Preventivo',
          color: Colors.green,
        ),
        _HealthEvent(
          date: '10 Ene 2026',
          title: 'Mastitis Leve',
          type: 'Curativo',
          color: Colors.red,
        ),
        _HealthEvent(
          date: '05 Dic 2025',
          title: 'Vitaminas B12',
          type: 'Rutina',
          color: Colors.blue,
        ),
      ],
    );
  }
}

class _HealthEvent extends StatelessWidget {
  final String date;
  final String title;
  final String type;
  final Color color;

  const _HealthEvent({
    required this.date,
    required this.title,
    required this.type,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                date.split(' ')[0],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                date.split(' ')[1],
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(width: 15),
          Container(width: 2, height: 40, color: Colors.grey[200]),
          const SizedBox(width: 15),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border(left: BorderSide(color: color, width: 4)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(fontSize: 10, color: color),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
