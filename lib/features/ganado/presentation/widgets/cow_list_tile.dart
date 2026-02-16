import 'package:flutter/material.dart';

class CowListTile extends StatelessWidget {
  final String cowId;
  final String name;
  final String status; // 'Preñada', 'Seca', 'Novilla'
  final Color statusColor;
  final VoidCallback onTap;

  const CowListTile({
    super.key,
    required this.cowId,
    required this.name,
    required this.status,
    required this.statusColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        onTap: onTap,
        // FOTO (Simulada con un icono y color)
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
            image: const DecorationImage(
              // Aquí iría la foto real. Usamos un placeholder visual.
              image: NetworkImage('https://via.placeholder.com/150'),
              fit: BoxFit.cover,
            ),
          ),
          child: Icon(Icons.pets, color: Colors.grey), // Fallback
        ),
        // NOMBRE E ID
        title: Text(
          name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Text('ID: $cowId', style: TextStyle(color: Colors.grey[600])),
        // ESTADO (Badge de color)
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: statusColor.withOpacity(0.5)),
          ),
          child: Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
