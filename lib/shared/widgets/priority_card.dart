import 'package:flutter/material.dart';

class PriorityCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color; // El color base (Rojo, Naranja, Azul)
  final VoidCallback onTap;
  final String actionLabel;

  const PriorityCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
    this.actionLabel = 'Ver detalle',
  });

  @override
  Widget build(BuildContext context) {
    // Diseño "Flat Moderno": Sin elevación fuerte, usamos colores suaves de fondo
    return Card(
      elevation: 0,
      color: color.withOpacity(
        0.05,
      ), // Fondo casi blanco pero con tinte del color
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // Bordes muy redondeados
        side: BorderSide(
          color: color.withOpacity(0.2),
          width: 1,
        ), // Borde sutil
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- ICONO MEJORADO (Estilo App Moderna) ---
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: color.withOpacity(
                        0.15,
                      ), // Fondo del icono más intenso
                      borderRadius: BorderRadius.circular(
                        16,
                      ), // "Squircle" (Cuadrado redondeado)
                    ),
                    child: Center(child: Icon(icon, color: color, size: 28)),
                  ),
                  const SizedBox(width: 16),

                  // --- TEXTOS ---
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.w800, // Extra negrita para jerarquía
                            color: Colors.black87,
                            letterSpacing: -0.5, // Estilo moderno compacto
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors
                                .grey[700], // Gris oscuro para lectura fácil
                            height: 1.4, // Mejor espaciado entre líneas
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // --- BOTÓN DE ACCIÓN (Inferior Derecho) ---
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        actionLabel,
                        style: TextStyle(
                          color: color,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(Icons.arrow_forward_rounded, size: 14, color: color),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
