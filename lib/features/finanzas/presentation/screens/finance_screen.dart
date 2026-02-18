import 'package:flutter/material.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Finanzas'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // BALANCE GENERAL
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text('Balance del Mes',
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(height: 10),
                  const Text('\$ 4,250.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _FinanceIndicator(
                          label: 'Ingresos',
                          value: '+\$8,500',
                          color: Colors.greenAccent),
                      Container(width: 1, height: 40, color: Colors.grey),
                      _FinanceIndicator(
                          label: 'Gastos',
                          value: '-\$4,250',
                          color: Colors.redAccent),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // DESGLOSE (Lista visual)
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Movimientos Recientes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 15),

            _TransactionItem(
              title: 'Venta de Leche (Quincena 1)',
              category: 'Ingreso',
              amount: '+\$ 4,100.00',
              date: '15 Feb 2026',
              isIncome: true,
            ),
            _TransactionItem(
              title: 'Compra Concentrado',
              category: 'Alimentación',
              amount: '-\$ 850.00',
              date: '14 Feb 2026',
              isIncome: false,
            ),
            _TransactionItem(
              title: 'Pago Veterinario',
              category: 'Sanidad',
              amount: '-\$ 120.00',
              date: '10 Feb 2026',
              isIncome: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _FinanceIndicator extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _FinanceIndicator(
      {required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value,
            style: TextStyle(
                color: color, fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final String title;
  final String category;
  final String amount;
  final String date;
  final bool isIncome;

  const _TransactionItem({
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.isIncome,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isIncome ? Colors.green[50] : Colors.red[50],
          shape: BoxShape.circle,
        ),
        child: Icon(
          isIncome ? Icons.attach_money : Icons.shopping_bag_outlined,
          color: isIncome ? Colors.green : Colors.red,
        ),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text('$date • $category'),
      trailing: Text(
        amount,
        style: TextStyle(
          color: isIncome ? Colors.green[700] : Colors.red[700],
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
