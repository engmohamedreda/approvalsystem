import 'package:flutter/material.dart';
import '../../../../data/model/expenses_model.dart';

class ExpenseViewModel extends ChangeNotifier {
  late ExpenseModel _expense;

  ExpenseModel get expense => _expense;

  ExpenseViewModel() {
    loadMockData();
  }

  void loadMockData() {
    _expense = ExpenseModel(
      company: 'ElAmir',
      requesterName: 'Salma Ramadan',
      businessType: 'Toll Fees',
      branch: 'Alexandria',
      fromDate: DateTime(2023, 6, 1),
      toDate: DateTime(2023, 6, 30),
      items: [
        ExpenseItem(description: 'Cairo-Alexandria Desert Road toll fees', quantity: 4, unitPrice: 85.5),
        ExpenseItem(description: 'Alexandria Ring Road toll fees', quantity: 2, unitPrice: 40.0),
      ],
      comments: [
        Comment(status: 'Pending', by: 'Drivers Supervisor', dateTime: DateTime(2023, 6, 1, 10, 30)),
        Comment(status: 'Rejected', by: 'Shipping Manager', dateTime: DateTime(2023, 6, 1, 14, 15)),
        Comment(status: 'Pending', by: 'Drivers Supervisor', dateTime: DateTime(2023, 6, 2, 9, 0)),
        Comment(status: 'Approved', by: 'Shipping Manager', dateTime: DateTime(2023, 6, 2, 11, 45)),
        Comment(status: 'Approved', by: 'Account Manager', dateTime: DateTime(2023, 6, 3, 10, 0)),
      ],
    );

    notifyListeners();
  }
}
