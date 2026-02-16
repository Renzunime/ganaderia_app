import 'package:flutter/material.dart';

class MilkChart extends StatelessWidget {
  const MilkChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Producción (7 días)',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Total: 145L',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _Bar(label: 'Lun', height: 80, color: Colors.blue[200]!),
              _Bar(label: 'Mar', height: 90, color: Colors.blue[300]!),
              _Bar(
                label: 'Mié',
                height: 60,
                color: Colors.orange[300]!,
              ), // Bajó
              _Bar(label: 'Jue', height: 85, color: Colors.blue[300]!),
              _Bar(label: 'Vie', height: 95, color: Colors.blue),
              _Bar(label: 'Sáb', height: 90, color: Colors.blue),
              _Bar(label: 'Dom', height: 100, color: Colors.blue[800]!),
            ],
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final String label;
  final double height;
  final Color color;

  const _Bar({required this.label, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 20,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }
}
