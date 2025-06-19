import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/CustomText.dart';
import '../../../view_model/expenses/expenses_wizard_view_model.dart';

class StepCredentials extends StatelessWidget {
  const StepCredentials({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExpensesWizardViewModel>();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: CustomTextFormField(
        controller: viewModel.usernameController,
        hintText: 'التعليق',
        suffixIcon: const Icon(Icons.send),
      ),
    );
  }
}