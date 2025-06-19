import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/expenses/expensesviewmodel.dart';
import 'expenses/comment_card.dart';
import 'expenses/steps/RequestDetailsSection.dart';
import 'expenses/steps/expense_item_card.dart';

class ExpenseRequestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpenseViewModel(),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Consumer<ExpenseViewModel>(
            builder: (context, viewModel, child) {
              final expense = viewModel.expense;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('مصروفات', style: TextStyle(color: Colors.white, fontSize: 24)),
                    SizedBox(height: 12),
                    RequestDetailsSection(expense: expense),
                    SizedBox(height: 16),
                    Text('EXPENSE ITEMS', style: TextStyle(color: Colors.white)),
                    ...expense.items.asMap().entries.map((entry) {
                      return ExpenseItemCard(item: entry.value, index: entry.key + 1);
                    }),
                    SizedBox(height: 16),
                    Text('COMMENTS HISTORY', style: TextStyle(color: Colors.white)),
                    ...expense.comments.map((c) => CommentCard(comment: c)),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
