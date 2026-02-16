import 'package:flutter/material.dart';

class RationCalculatorScreen extends StatefulWidget {
  const RationCalculatorScreen({super.key});

  @override
  State<RationCalculatorScreen> createState() => _RationCalculatorScreenState();
}

class _RationCalculatorScreenState extends State<RationCalculatorScreen> {
  // Variables de estado (Lo que cambia en la pantalla)
  double _pesoVaca = 450; // Valor inicial
  String _condicionPasto = 'Regular'; // Valor inicial
  bool _resultadoVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asistente Nutricional'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- PREGUNTA 1: PESO ---
            const Text(
              '1. ¿Cuánto pesa el animal?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Slider Interactivo
            Row(
              children: [
                Icon(Icons.monitor_weight_outlined, color: Colors.green[700]),
                const SizedBox(width: 10),
                Text(
                  '${_pesoVaca.toInt()} Kg',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Slider(
              value: _pesoVaca,
              min: 200,
              max: 800,
              divisions: 60,
              activeColor: Colors.green[700],
              label: '${_pesoVaca.toInt()} kg',
              onChanged: (valor) {
                setState(() {
                  _pesoVaca = valor;
                  _resultadoVisible =
                      false; // Ocultar resultado si cambia el input
                });
              },
            ),

            const SizedBox(height: 30),

            // --- PREGUNTA 2: PASTO ---
            const Text(
              '2. ¿Cómo está el pasto hoy?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Chips de Selección (Más bonito que un Dropdown)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _OptionChip(
                  label: 'Verde/Bueno',
                  selected: _condicionPasto == 'Bueno',
                  onTap: () => setState(() {
                    _condicionPasto = 'Bueno';
                    _resultadoVisible = false;
                  }),
                ),
                _OptionChip(
                  label: 'Seco/Regular',
                  selected: _condicionPasto == 'Regular',
                  onTap: () => setState(() {
                    _condicionPasto = 'Regular';
                    _resultadoVisible = false;
                  }),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // --- BOTÓN CALCULAR ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _resultadoVisible = true; // MOSTRAR LA MAGIA
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black87,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                ),
                child: const Text(
                  'CONSULTAR AL ZOOTECNISTA',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // --- LA MAGIA (RESULTADO) ---
            if (_resultadoVisible)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _condicionPasto == 'Bueno'
                      ? Colors.green[50]
                      : Colors.orange[50], // Color cambia según lógica
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: _condicionPasto == 'Bueno'
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.lightbulb,
                          color: _condicionPasto == 'Bueno'
                              ? Colors.green
                              : Colors.orange,
                          size: 30,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Recomendación:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                    const SizedBox(height: 10),
                    Text(
                      _condicionPasto == 'Bueno'
                          ? 'El pasto cubre los requerimientos básicos. Solo ofrece sal mineral a voluntad.'
                          : '⚠️ ALERTA: Proteína Baja. Debido al pasto seco, este animal de ${_pesoVaca.toInt()}kg perderá peso.',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    if (_condicionPasto == 'Regular')
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.add_circle, color: Colors.blue),
                            SizedBox(width: 10),
                            Text(
                              'Sugerencia: Agregar 1.5kg de Melaza',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Widget pequeño para los botones de selección
class _OptionChip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _OptionChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.green[700] : Colors.grey[200],
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
