import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../view_model/expenses/expenses_wizard_view_model.dart';


class StepItems extends StatelessWidget {
  const StepItems({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ExpensesWizardViewModel>();
    final state = viewModel.state;

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const Text('الأصناف', style: TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
              itemCount: state.items.length,
              separatorBuilder: (_, __) => const Divider(color: Colors.grey),
              itemBuilder: (context, index) {
                final item = state.items[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('المجموع: ${item.total.toStringAsFixed(1)}', style: const TextStyle(color: Colors.white)),
                        IconButton(
                          onPressed: () => viewModel.removeItem(index),
                          icon: const Icon(Icons.delete, color: Colors.white),
                        ),
                      ],
                    ),
                    TextField(
                      onChanged: (val) => viewModel.updateItem(index, details: val),
                      decoration: const InputDecoration(
                        hintText: 'تفاصيل الصنف',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (val) => viewModel.updateItem(index, price: double.tryParse(val) ?? 0),
                            decoration: const InputDecoration(
                              hintText: 'السعر',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: TextField(
                            keyboardType: TextInputType.number,
                            onChanged: (val) => viewModel.updateItem(index, quantity: int.tryParse(val) ?? 0),
                            decoration: const InputDecoration(
                              hintText: 'الكمية',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(),
                            ),
                            style: const TextStyle(color: Colors.white),
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
                onPressed: viewModel.addItem,
                child: const Text('أضف صنف'),
              ),
              const Spacer(),
              Text('المجموع الكلي: ${state.totalSum.toStringAsFixed(1)}', style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}