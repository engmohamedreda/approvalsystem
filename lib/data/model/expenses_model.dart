class ExpenseModel {
  final String company;
  final String requesterName;
  final String businessType;
  final String branch;
  final DateTime fromDate;
  final DateTime toDate;
  final List<ExpenseItem> items;
  final List<Comment> comments;

  ExpenseModel({
    required this.company,
    required this.requesterName,
    required this.businessType,
    required this.branch,
    required this.fromDate,
    required this.toDate,
    required this.items,
    required this.comments,
  });
}

class ExpenseItem {
  final String description;
  final int quantity;
  final double unitPrice;

  ExpenseItem({required this.description, required this.quantity, required this.unitPrice});
}

class Comment {
  final String status;
  final String by;
  final DateTime dateTime;

  Comment({required this.status, required this.by, required this.dateTime});
}
