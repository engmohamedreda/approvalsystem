import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../view_model/expenses/expensesviewmodel.dart';
import 'expenses/comment_card.dart';
import 'expenses/steps/RequestDetailsSection.dart';
import 'expenses/steps/expense_item_card.dart';

class ExpenseRequestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
  final theme = Theme.of(context);
  final isDark = theme.brightness == Brightness.light;
    return ChangeNotifierProvider(
      create: (_) => ExpenseViewModel(),
      child: Scaffold(
        appBar:AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: isDark ? Colors.black : Colors.white,
            onPressed: () {
              context.go('/Home');
            },
          ),
          title: Text(
            'الطلب',
            style: TextStyle(
              color: isDark ? Colors.black : Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: isDark ? Colors.white : Colors.black,
        ),
        body: SafeArea(

          child: Consumer<ExpenseViewModel>(
            builder: (context, viewModel, child) {
              final expense = viewModel.expense;

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    const SizedBox(height: 12),

                    RequestDetailsSection(expense: expense),

                    const SizedBox(height: 16),
                    Text('EXPENSE ITEMS', style: TextStyle(color: Colors.white)),

                    ...expense.items.asMap().entries.map((entry) {
                      return ExpenseItemCard(item: entry.value, index: entry.key + 1);
                    }),

                    // 💰 Grand total section
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "EGP ${expense.items.fold(0, (sum, i) => sum + (0)).toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    // 🖼️ Images section
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(child: Icon(Icons.image, color: Colors.white54)),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(child: Icon(Icons.insert_drive_file, color: Colors.white54)),
                          ),
                        ),
                      ],
                    ),

                    // 💬 Comments section
                    const SizedBox(height: 16),
                    const Text('COMMENTS HISTORY', style: TextStyle(color: Colors.grey)),

                    const SizedBox(height: 8),
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
