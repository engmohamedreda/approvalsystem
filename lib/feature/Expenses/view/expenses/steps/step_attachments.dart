import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/Appcolors.dart';
import '../../../view_model/expenses/expenses_wizard_view_model.dart';

class StepAttachments extends StatelessWidget {
  const StepAttachments({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExpensesWizardViewModel>();
    final state = viewModel.state;
    final theme = Theme.of(context);

    return Column(
      children: [
        GestureDetector(
          onTap: viewModel.pickImage,
          child: Container(
            height: 150,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.image, size: 40),
                  const SizedBox(height: 8),
                  Text("إضافة صور", style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: state.images.length,
            itemBuilder: (context, index) {
              final file = state.images[index];
              return Dismissible(
                key: ValueKey(file.path),
                direction: DismissDirection.endToStart,
                onDismissed: (_) => viewModel.removeImage(index),
                background: Container(
                  alignment: Alignment.centerRight,
                  color: AppColors.primary,
                  padding: const EdgeInsets.only(right: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white10),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox(
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        file,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}