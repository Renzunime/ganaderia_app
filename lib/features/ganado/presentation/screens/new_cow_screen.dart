import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Necesitas agregar intl en pubspec.yaml

class NewCowScreen extends StatefulWidget {
  const NewCowScreen({super.key});

  @override
  State<NewCowScreen> createState() => _NewCowScreenState();
}

class _NewCowScreenState extends State<NewCowScreen> {
  final _areteCtrl = TextEditingController();
  final _nombreCtrl = TextEditingController();
  final _fechaNacimientoCtrl = TextEditingController(); // Nuevo controlador

  String _razaSeleccionada = 'Brahman';
  String _generoSeleccionado = 'Hembra'; // Nuevo
  DateTime? _fechaNacimiento; // Variable para lógica

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Nuevo Animal')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ... (Tu código de FOTO se mantiene igual) ...

            // FORMULARIO
            _InputCampo(
              label: 'Número de Arete / ID',
              icon: Icons.tag,
              controller: _areteCtrl,
            ),
            const SizedBox(height: 20),

            // FECHA DE NACIMIENTO (CAMBIO CLAVE)
            TextField(
              controller: _fechaNacimientoCtrl,
              readOnly: true, // No escribir, solo seleccionar
              decoration: InputDecoration(
                labelText: 'Fecha de Nacimiento',
                prefixIcon:
                    const Icon(Icons.calendar_today, color: Colors.green),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    _fechaNacimiento = pickedDate;
                    // Formato bonito para el usuario
                    _fechaNacimientoCtrl.text =
                        DateFormat('dd/MM/yyyy').format(pickedDate);
                  });
                }
              },
            ),
            const SizedBox(height: 20),

            _InputCampo(
              label: 'Nombre (Opcional)',
              icon: Icons.edit,
              controller: _nombreCtrl,
            ),

            const SizedBox(height: 20),

            // DROPDOWNS
            DropdownButtonFormField(
              value: _razaSeleccionada,
              decoration: _inputDecoration('Raza', Icons.category),
              items: ['Brahman', 'Holstein', 'Gyr', 'Angus']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) =>
                  setState(() => _razaSeleccionada = v.toString()),
            ),

            const SizedBox(height: 20),

            // Género (Importante para saber si dará leche o carne)
            DropdownButtonFormField(
              value: _generoSeleccionado,
              decoration: _inputDecoration('Sexo', Icons.male),
              items: ['Hembra', 'Macho']
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) =>
                  setState(() => _generoSeleccionado = v.toString()),
            ),

            const SizedBox(height: 40),

            // BOTÓN GUARDAR
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _guardarAnimal, // Llamamos a función dedicada
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  foregroundColor: Colors.white,
                ),
                child: const Text('GUARDAR ANIMAL',
                    style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _guardarAnimal() {
    // 1. Validación
    if (_areteCtrl.text.isEmpty || _fechaNacimiento == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Por favor completa Arete y Fecha Nacimiento')),
      );
      return;
    }

    // 2. Aquí crearemos la instancia del Modelo (Paso futuro: Guardar en BD)
    // final nuevaVaca = Cow(id: uuid, areteNumber: _areteCtrl.text, ...);

    Navigator.pop(context);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content: Text('Vaca registrada con inteligencia de datos')),
    );
  }

  // ... (Tus estilos _inputDecoration y _InputCampo se mantienen igual) ...
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.green),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}

class _InputCampo extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  const _InputCampo(
      {required this.label, required this.icon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.green),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
