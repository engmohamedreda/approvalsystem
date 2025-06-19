import 'package:flutter/material.dart';
import '../../../../../data/model/expenses_model.dart';

class ExpenseItemCard extends StatelessWidget {
  final ExpenseItem item;
  final int index;

  const ExpenseItemCard({required this.item, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white24,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Item $index', style: TextStyle(color: Colors.blueAccent, fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            _buildRow('Description', item.description),
            _buildRow('Quantity', item.quantity.toString()),
            _buildRow('Unit Price', 'EGP ${item.unitPrice.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(child: Text(label, style: TextStyle(color: Colors.grey))),
          Expanded(child: Text(value, style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
