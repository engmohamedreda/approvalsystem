import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utils/Appcolors.dart';
import '../../view_model/expenses/expenses_wizard_view_model.dart';
import 'steps/step_details.dart';
import 'steps/step_items.dart';
import 'steps/step_attachments.dart';
import 'steps/step_credentials.dart';

class ExpensesWizardPage extends StatelessWidget {
  const ExpensesWizardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ExpensesWizardViewModel(),
      child: const ExpensesWizardView(),
    );
  }
}

class ExpensesWizardView extends StatelessWidget {
  const ExpensesWizardView({super.key});

  final int totalSteps = 4;

  Widget _buildStepContent(int step) {
    switch (step) {
      case 0:
        return const StepDetails();
      case 1:
        return const StepItems();
      case 2:
        return const StepAttachments();
      case 3:
        return const StepCredentials();
      default:
        return const Center(child: Text("خطأ في الخطوات", style: TextStyle(color: Colors.white)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExpensesWizardViewModel>();
    final step = viewModel.currentStep;
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('مصاريف'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: List.generate(totalSteps, (index) {
                  return Expanded(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: index <= step ? AppColors.primary : theme.dividerColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Expanded(child: _buildStepContent(step)),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (step > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: viewModel.prevStep,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.blue),
                        ),
                        child: const Text("رجوع"),
                      ),
                    ),
                  if (step > 0) const SizedBox(width: 10), // مسافة بين الزرين إذا كان زر الرجوع ظاهر
                  Expanded(
                    flex: step == 0 ? 2 : 1,
                    child: ElevatedButton(
                      onPressed: step < totalSteps - 1
                          ? viewModel.nextStep
                          : () {
                        print("Submit");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(step < totalSteps - 1 ? "التالي" : "حفظ"),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}