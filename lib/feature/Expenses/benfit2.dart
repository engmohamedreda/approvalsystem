import 'package:flutter/material.dart';

import '../../utils/Appcolors.dart';
class ExpensesPage extends StatefulWidget {
  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  List<ItemEntry> items = [ItemEntry()];

  double get totalSum => items.fold(0, (sum, item) => sum + item.total);

  void addItem() {
    setState(() {
      items.add(ItemEntry());
    });
  }

  void removeItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  void updateItem(int index, {double? price, int? quantity, String? details}) {
    setState(() {
      if (price != null) items[index].price = price;
      if (quantity != null) items[index].quantity = quantity;
      if (details != null) items[index].details = details;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        color: index == 1
                            ? AppColors.primary
                            : theme.dividerColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  );
                }),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: items.length,
                  separatorBuilder: (_, __) => Divider(color: Colors.grey),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'المجموع: ${item.total.toStringAsFixed(1)}',
                              style: TextStyle(color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () => removeItem(index),
                              icon: Icon(Icons.delete, color: Colors.white),
                            ),

                          ],
                        ),
                        TextField(
                          onChanged: (val) => updateItem(index, details: val),
                          decoration: InputDecoration(
                            hintText: 'تفاصيل الصنف',
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (val) => updateItem(index,
                                    price: double.tryParse(val) ?? 0),
                                decoration: InputDecoration(
                                  hintText: 'السعر',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: TextField(
                                keyboardType: TextInputType.number,
                                onChanged: (val) => updateItem(index,
                                    quantity: int.tryParse(val) ?? 0),
                                decoration: InputDecoration(
                                  hintText: 'الكمية',
                                  hintStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(),
                                ),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: addItem,
                    child: Text('أضف صنف'),
                  ),
                  Spacer(),
                  Text(
                    'المجموع الكلي: ${totalSum.toStringAsFixed(1)}',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('التالي'),
                    ),
                  ),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text('رجوع', style: TextStyle(color: Colors.blue)),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemEntry {
  String details = '';
  double price = 0;
  int quantity = 0;

  double get total => price * quantity;
}
