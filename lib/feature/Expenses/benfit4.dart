import 'package:flutter/material.dart';
import '../../utils/Appcolors.dart';
import '../../utils/CustomText.dart';

class ExpensesPage4 extends StatefulWidget {
  @override
  State<ExpensesPage4> createState() => _ExpensesPageState4();
}

class _ExpensesPageState4 extends State<ExpensesPage4> {
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    var formkey = GlobalKey<FormState>();
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text('مصروفات'),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // المحتوى العلوي
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('الأصناف', style: TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      return Expanded(
                        child: Container(
                          height: 6,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: index == 4 ? AppColors.primary : theme.dividerColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 20),
                  Form(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: CustomTextFormField(
                        controller: email,
                        hintText: 'اسم المستخدم',
                        suffixIcon: Icon(Icons.send),
                      ),
                    ),
                  ),
                ],
              ),

              // الأزرار في الأسفل
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('التالي'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('رجوع', style: TextStyle(color: Colors.blue)),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
