import 'package:approval/utils/Appcolors.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../../../utils/CustomText.dart';
class ExpensesRequestPage extends StatefulWidget {
  const ExpensesRequestPage({super.key});
  @override
  State<ExpensesRequestPage> createState() => _ExpensesRequestPageState();
}
class _ExpensesRequestPageState extends State<ExpensesRequestPage> {
  TextEditingController name = TextEditingController();

  final List<String> companies = ['شركة A', 'شركة B', 'شركة C'];
  final List<String> requestTypes = ['طلب 1', 'طلب 2', 'طلب 3'];
  final List<String> branches = ['فرع القاهرة', 'فرع جدة', 'فرع الرياض'];
  String? selectedCompany;
  String? selectedName;
  String? selectedRequestType;
  String? selectedBranch;
  DateTime? fromDate;
  DateTime? toDate;
  Future<void> _pickDate(BuildContext context, bool isFromDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) => Theme(data: ThemeData.light(), child: child!),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.white;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.scaffoldBackgroundColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: theme.iconTheme.color),
            onPressed: () {},
          ),
          title: Text('مصاريف', style: theme.appBarTheme.titleTextStyle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('تفاصيل الطلب',
                  style: TextStyle(color: textColor, fontSize: 20)),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(4, (index) {
                  return Expanded(
                    child: Container(
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: index == 0
                            ? AppColors.primary
                            : theme.dividerColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 30),
              buildDropdown('الشركه', companies, selectedCompany,
                      (val) => setState(() => selectedCompany = val), textColor),
              CustomTextFormField(controller: name,hintText: 'الاسم ', hintStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontStyle: FontStyle.italic,
              ),
        ),
              buildDropdown('نوع الطلب', requestTypes, selectedRequestType,
                      (val) => setState(() => selectedRequestType = val), textColor),
              buildDropdown('الفرع', branches, selectedBranch,
                      (val) => setState(() => selectedBranch = val), textColor),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: buildDatePicker(
                      context: context,
                      label: 'من التاريخ',
                      selectedDate: fromDate,
                      onTap: () => _pickDate(context, true),
                      textColor: textColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: buildDatePicker(
                      context: context,
                      label: 'الى التاريخ',
                      selectedDate: toDate,
                      onTap: () => _pickDate(context, false),
                      textColor: textColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('التالي',
                      style: TextStyle(
                          fontSize: 18,
                          color: theme.primaryTextTheme.labelLarge?.color)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildDropdown(String label, List<String> items, String? selectedItem,
      void Function(String?) onChanged, Color textColor) {
    final theme = Theme.of(context);
    return Container(
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
        labelStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
        contentPadding: EdgeInsets.zero,
      ),
      dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: Colors.black, // Change this to your desired color
            borderRadius: BorderRadius.circular(8),
          ),),
      style: TextStyle(color: Colors.white),
      iconStyleData: IconStyleData(
        icon: Icon(Icons.arrow_drop_down, color: theme.iconTheme.color),
      ),

      items: items
          .map((item) => DropdownMenuItem<String>(
        value: item,
        alignment: Alignment.centerRight, // align the row
        child: Text(
          item,

          textAlign: TextAlign.right, // align the text
        ),
      ))
          .toList(),

      selectedItemBuilder: (context) {
        return items.map((item) {
          return Align(
            alignment: Alignment.centerRight,
            child: Text(
              item,
              textAlign: TextAlign.right,
              style: TextStyle(color: textColor),
            ),
          );
        }).toList();
      },

      value: selectedItem,
      onChanged: onChanged,
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
