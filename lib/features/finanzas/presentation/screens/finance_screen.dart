import 'package:flutter/material.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Finanzas de la Finca',
            style:
                TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. TARJETA DE BALANCE PRINCIPAL (Estilo Tarjeta de Crédito)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green[800]!, Colors.green[600]!],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 10)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Balance Total (Este Mes)',
                      style: TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 10),
                  const Text('\$ 4,500.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _FinanceIndicator(
                          label: 'Ingresos',
                          value: '+\$ 6,200',
                          icon: Icons.arrow_upward,
                          color: Colors.lightGreenAccent),
                      Container(width: 1, height: 40, color: Colors.white24),
                      _FinanceIndicator(
                          label: 'Gastos',
                          value: '-\$ 1,700',
                          icon: Icons.arrow_downward,
                          color: Colors.redAccent),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 2. ACCIONES RÁPIDAS
            const Text('Registrar Transacción',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                    child: _ActionButton(
                        icon: Icons.monetization_on,
                        label: 'Venta Leche',
                        color: Colors.blue)),
                const SizedBox(width: 15),
                Expanded(
                    child: _ActionButton(
                        icon: Icons.shopping_bag,
                        label: 'Compra Insumos',
                        color: Colors.orange)),
              ],
            ),

            const SizedBox(height: 30),

            // 3. LISTA DE ÚLTIMOS MOVIMIENTOS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Movimientos Recientes',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(onPressed: () {}, child: const Text('Ver Todo')),
              ],
            ),
            const SizedBox(height: 10),
            _TransactionTile(
                title: 'Venta Lote #4',
                date: 'Hoy, 10:00 AM',
                amount: '+\$ 1,200.00',
                isIncome: true),
            _TransactionTile(
                title: 'Compra Vacunas',
                date: 'Ayer, 4:30 PM',
                amount: '-\$ 350.00',
                isIncome: false),
            _TransactionTile(
                title: 'Pago Veterinario',
                date: '15 Feb, 9:00 AM',
                amount: '-\$ 120.00',
                isIncome: false),
          ],
        ),
      ),
    );
  }
}

class _FinanceIndicator extends StatelessWidget {
  final String label, value;
  final IconData icon;
  final Color color;
  const _FinanceIndicator(
      {required this.label,
      required this.value,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(width: 5),
            Text(label, style: const TextStyle(color: Colors.white70)),
          ],
        ),
        const SizedBox(height: 5),
        Text(value,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  const _ActionButton(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey[200]!)),
      child: Column(children: [
        Icon(icon, color: color, size: 28),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold))
      ]),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final String title, date, amount;
  final bool isIncome;
  const _TransactionTile(
      {required this.title,
      required this.date,
      required this.amount,
      required this.isIncome});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: isIncome ? Colors.green[50] : Colors.red[50],
                shape: BoxShape.circle),
            child: Icon(isIncome ? Icons.arrow_downward : Icons.arrow_upward,
                color: isIncome ? Colors.green : Colors.red),
          ),
          const SizedBox(width: 15),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(date,
                  style: const TextStyle(color: Colors.grey, fontSize: 12))
            ]),
          ),
          Text(amount,
              style: TextStyle(
                  color: isIncome ? Colors.green[700] : Colors.red[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
        ],
      ),
    );
  }
}
