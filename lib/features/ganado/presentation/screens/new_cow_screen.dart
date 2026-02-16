import 'package:flutter/material.dart';

class NewCowScreen extends StatefulWidget {
  const NewCowScreen({super.key});

  @override
  State<NewCowScreen> createState() => _NewCowScreenState();
}

class _NewCowScreenState extends State<NewCowScreen> {
  // Controladores de Texto
  final _areteCtrl = TextEditingController();
  final _nombreCtrl = TextEditingController();
  String _razaSeleccionada = 'Brahman';
  String _estadoSeleccionado = 'Novilla';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar Nuevo Animal')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Datos Generales',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // FOTO
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add_a_photo,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // FORMULARIO
            _InputCampo(
              label: 'Número de Arete / ID',
              icon: Icons.tag,
              controller: _areteCtrl,
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
              items: [
                'Brahman',
                'Holstein',
                'Gyr',
                'Angus',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) =>
                  setState(() => _razaSeleccionada = v.toString()),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField(
              value: _estadoSeleccionado,
              decoration: _inputDecoration(
                'Estado Inicial',
                Icons.health_and_safety,
              ),
              items: [
                'Cría',
                'Novilla',
                'Vaca Seca',
                'Vaca Parida',
              ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              onChanged: (v) =>
                  setState(() => _estadoSeleccionado = v.toString()),
            ),

            const SizedBox(height: 40),

            // BOTÓN GUARDAR
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Vaca registrada con éxito')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'GUARDAR ANIMAL',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Estilo de inputs
  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.green),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.green, width: 2),
      ),
    );
  }
}

// Widget auxiliar para inputs de texto
class _InputCampo extends StatelessWidget {
  final String label;
  final IconData icon;
  final TextEditingController controller;
  const _InputCampo({
    required this.label,
    required this.icon,
    required this.controller,
  });

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
