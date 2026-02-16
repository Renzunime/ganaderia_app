import 'package:flutter/material.dart';
import 'package:ganaderia_app/features/ganado/presentation/widgets/cow_list_tile.dart';
import 'package:ganaderia_app/features/ganado/presentation/screens/cow_detail_screen.dart';
import 'package:ganaderia_app/features/ganado/presentation/screens/new_cow_screen.dart'; // <--- IMPORTANTE

class GanadoScreen extends StatelessWidget {
  const GanadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          height: 45,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: 'Buscar por arete o nombre...',
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Column(
            children: [
              // --- FILTROS RÁPIDOS ---
              SizedBox(
                height: 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  children: const [
                    _FilterChip(label: 'Todas', isSelected: true),
                    _FilterChip(label: 'Preñadas', isSelected: false),
                    _FilterChip(label: 'Secas', isSelected: false),
                    _FilterChip(label: 'Crías', isSelected: false),
                  ],
                ),
              ),

              // --- LISTA DE ANIMALES ---
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Vaca 1
                    CowListTile(
                      cowId: '#405',
                      name: 'Lola',
                      status: 'Preñada',
                      statusColor: Colors.pink,
                      onTap: () => _navigateToDetail(context, '#405'),
                    ),
                    // Vaca 2
                    CowListTile(
                      cowId: '#203',
                      name: 'Manchas',
                      status: 'Seca',
                      statusColor: Colors.orange,
                      onTap: () => _navigateToDetail(context, '#203'),
                    ),
                    // Vaca 3
                    CowListTile(
                      cowId: '#105',
                      name: 'Estrella',
                      status: 'Producción',
                      statusColor: Colors.green,
                      onTap: () => _navigateToDetail(context, '#105'),
                    ),
                    // Vaca 4
                    CowListTile(
                      cowId: '#889',
                      name: 'Gitana',
                      status: 'Novilla',
                      statusColor: Colors.blue,
                      onTap: () => _navigateToDetail(context, '#889'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // EL FAB AHORA NAVEGA A LA PANTALLA NUEVA
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NewCowScreen()),
          );
        },
        backgroundColor: Colors.green[700],
        icon: const Icon(Icons.add),
        label: const Text('Nueva Vaca'),
      ),
    );
  }

  void _navigateToDetail(BuildContext context, String id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CowDetailScreen(cowId: id)),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  const _FilterChip({required this.label, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {},
        backgroundColor: Colors.white,
        selectedColor: Colors.green[100],
        labelStyle: TextStyle(
          color: isSelected ? Colors.green[800] : Colors.black87,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            color: isSelected ? Colors.green : Colors.grey[300]!,
          ),
        ),
        showCheckmark: false,
      ),
    );
  }
}
