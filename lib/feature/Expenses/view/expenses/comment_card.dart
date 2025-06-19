import 'package:flutter/material.dart';
import '../../../../data/model/expenses_model.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;

  const CommentCard({required this.comment});

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'approved':
        return Colors.green;
      case 'rejected':
        return Colors.red;
      case 'pending':
        return Colors.amber;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = getStatusColor(comment.status);
    final formattedDate = '${comment.dateTime.year}-${comment.dateTime.month.toString().padLeft(2, '0')}-${comment.dateTime.day.toString().padLeft(2, '0')} '
        '${comment.dateTime.hour}:${comment.dateTime.minute.toString().padLeft(2, '0')}';

    return Card(
      color: Colors.white24,
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: statusColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            comment.status.toUpperCase(),
            style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(comment.by, style: TextStyle(color: Colors.white)),
        subtitle: Text(formattedDate, style: TextStyle(color: Colors.grey)),
        trailing: CircleAvatar(
          backgroundColor: Colors.grey.shade700,
          child: Icon(Icons.person, color: Colors.white),
        ),
      ),
    );
  }
}
