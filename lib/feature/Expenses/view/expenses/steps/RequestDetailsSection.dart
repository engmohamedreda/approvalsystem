import 'package:flutter/material.dart';

import '../../../../../data/model/expenses_model.dart';

class RequestDetailsSection extends StatelessWidget {
  final ExpenseModel expense;

  const RequestDetailsSection({required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white24,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            _buildRow('Company', expense.company),
            _buildRow('Requester Name', expense.requesterName),
            _buildRow('Business Type', expense.businessType),
            _buildRow('Branch', expense.branch),
            _buildRow('From Date', '${expense.fromDate.toLocal()}'.split(' ')[0]),
            _buildRow('To Date', '${expense.toDate.toLocal()}'.split(' ')[0]),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(child: Text(title, style: TextStyle(color: Colors.grey))),
          Expanded(child: Text(value, style: TextStyle(color: Colors.white))),
        ],
      ),
    );
  }
}
