import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../utils/CustomText.dart';
import '../../../view_model/expenses/expenses_wizard_view_model.dart';
class StepDetails extends StatelessWidget {
  const StepDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExpensesWizardViewModel>();
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.white;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('تفاصيل الطلب', style: TextStyle(color: textColor, fontSize: 20)),
          const SizedBox(height: 20),

          buildDropdown(context, 'الشركه', viewModel.companies, viewModel.state.selectedCompany,
              viewModel.setCompany, textColor),
          CustomTextFormField(
            controller: viewModel.nameController,
            hintText: 'الاسم',
            hintStyle: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontStyle: FontStyle.italic,
            ),
          ),
          buildDropdown(context, 'نوع الطلب', viewModel.requestTypes,
              viewModel.state.selectedRequestType, viewModel.setRequestType, textColor),
          buildDropdown(context, 'الفرع', viewModel.branches,
              viewModel.state.selectedBranch, viewModel.setBranch, textColor),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: buildDatePicker(
                  context: context,
                  label: 'من التاريخ',
                  selectedDate: viewModel.state.fromDate,
                  onTap: () => viewModel.pickDate(context, true),
                  textColor: textColor,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: buildDatePicker(
                  context: context,
                  label: 'الى التاريخ',
                  selectedDate: viewModel.state.toDate,
                  onTap: () => viewModel.pickDate(context, false),
                  textColor: textColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget buildDropdown(
      BuildContext context,
      String label,
      List<String> items,
      String? selectedItem,
      void Function(String?) onChanged,
      Color textColor,
      )
  {
    final theme = Theme.of(context);
    return SizedBox(
      width: double.infinity ,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          border: Border.all(color: theme.dividerColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.white),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero,
          ),
          dropdownStyleData: DropdownStyleData(

            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          iconStyleData: IconStyleData(
            icon: Icon(Icons.arrow_drop_down, color: theme.iconTheme.color),
          ),
          style: const TextStyle(color: Colors.white),
          items: items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              alignment: Alignment.centerRight,
              child: Text(item, textAlign: TextAlign.right),
            );
          }).toList(),
          selectedItemBuilder: (context) {
            return items.map((item) {
              return Align(
                alignment: Alignment.centerRight,
                child: Text(item, textAlign: TextAlign.right, style: TextStyle(color: textColor)),
              );
            }).toList();
          },
          value: selectedItem,
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget buildDatePicker({
    required BuildContext context,
    required String label,
    required DateTime? selectedDate,
    required VoidCallback onTap,
    required Color textColor,
  }) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        border: Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(Icons.calendar_today, color: theme.iconTheme.color),
            const SizedBox(width: 8),
            Text(
              selectedDate != null
                  ? "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}"
                  : label,
              style: TextStyle(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}