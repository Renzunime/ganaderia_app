import 'package:flutter/material.dart';

class QuickActionModal extends StatefulWidget {
  final String actionType; // 'Ordeño', 'Peso'
  final String cowId;
  final Color color;

  const QuickActionModal({
    super.key,
    required this.actionType,
    required this.cowId,
    required this.color,
  });

  @override
  State<QuickActionModal> createState() => _QuickActionModalState();
}

class _QuickActionModalState extends State<QuickActionModal> {
  double _valor = 0; // Litros o Kilos
  DateTime _fecha = DateTime.now();

  @override
  void initState() {
    super.initState();
    // Valores iniciales lógicos según el tipo
    if (widget.actionType == 'Peso') _valor = 450;
    if (widget.actionType == 'Ordeño') _valor = 15;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Se ajusta al contenido
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TÍTULO
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.actionType == 'Ordeño'
                      ? Icons.water_drop
                      : Icons.monitor_weight,
                  color: widget.color,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Registrar ${widget.actionType}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Vaca ${widget.cowId}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),

          // CONTROL DESLIZANTE (SLIDER) - Mejor que escribir números
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Cantidad:',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              Text(
                widget.actionType == 'Ordeño'
                    ? '${_valor.toStringAsFixed(1)} L'
                    : '${_valor.toInt()} Kg',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: widget.color,
                ),
              ),
            ],
          ),
          Slider(
            value: _valor,
            min: widget.actionType == 'Ordeño' ? 0 : 200,
            max: widget.actionType == 'Ordeño' ? 40 : 800,
            divisions: widget.actionType == 'Ordeño'
                ? 80
                : 600, // Pasos de 0.5L o 1Kg
            activeColor: widget.color,
            onChanged: (v) => setState(() => _valor = v),
          ),

          const SizedBox(height: 20),

          // FECHA
          InkWell(
            onTap: () async {
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020),
                lastDate: DateTime.now(),
              );
              if (picked != null) setState(() => _fecha = picked);
            },
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Fecha del registro:',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    '${_fecha.day}/${_fecha.month}/${_fecha.year}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          // BOTÓN GUARDAR
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Cerrar modal
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      '${widget.actionType} registrado correctamente',
                    ),
                    backgroundColor: Colors.green[700],
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.color,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'GUARDAR DATOS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ), // Espacio para el borde inferior del iPhone
        ],
      ),
    );
  }
}
