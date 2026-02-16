import 'package:flutter/material.dart';

class PregnancyCalculatorScreen extends StatefulWidget {
  const PregnancyCalculatorScreen({super.key});

  @override
  State<PregnancyCalculatorScreen> createState() =>
      _PregnancyCalculatorScreenState();
}

class _PregnancyCalculatorScreenState extends State<PregnancyCalculatorScreen> {
  DateTime? _fechaInseminacion;
  DateTime? _fechaParto;
  DateTime? _fechaSecado;

  void _calcularFechas(DateTime fecha) {
    setState(() {
      _fechaInseminacion = fecha;
      // Regla aproximada: 283 días de gestación para bovinos
      _fechaParto = fecha.add(const Duration(days: 283));
      // Secado: 60 días antes del parto (223 días después de inseminación)
      _fechaSecado = fecha.add(const Duration(days: 223));
    });
  }

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      // Tema verde para el calendario
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Colors.green),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _fechaInseminacion) {
      _calcularFechas(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de Parto'),
        backgroundColor:
            Colors.purple[700], // Color distintivo para esta herramienta
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Selecciona la fecha de inseminación o monta:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),

            // BOTÓN DE CALENDARIO
            InkWell(
              onTap: () => _seleccionarFecha(context),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purple),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.calendar_today, color: Colors.purple),
                    const SizedBox(width: 15),
                    Text(
                      _fechaInseminacion == null
                          ? 'Tocar para elegir fecha'
                          : '${_fechaInseminacion!.day}/${_fechaInseminacion!.month}/${_fechaInseminacion!.year}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple[800],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // RESULTADOS
            if (_fechaParto != null) ...[
              _ResultCard(
                label: 'Fecha Probable de Parto',
                date: _fechaParto!,
                icon: Icons.baby_changing_station,
                color: Colors.green,
              ),
              const SizedBox(height: 20),
              _ResultCard(
                label: 'Iniciar Secado (7mo mes)',
                date: _fechaSecado!,
                icon: Icons.warning_amber_rounded,
                color: Colors.orange,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  final String label;
  final DateTime date;
  final IconData icon;
  final MaterialColor color;

  const _ResultCard({
    required this.label,
    required this.date,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border(left: BorderSide(color: color, width: 5)), // Borde lateral de color
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
              Text(
                '${date.day}/${date.month}/${date.year}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
