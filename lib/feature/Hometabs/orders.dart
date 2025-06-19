import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.light;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'الطلبات',
          style: TextStyle(
            color: isDark ? Colors.black : Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Directionality( // RTL
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'اختر نوع الطلب',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _buildButton(
                        icon: Icons.shopping_cart,
                        label: 'حاله الطلب',
                        onTap: () {
                         context.go('/ExpensesWizardPage');
                        },
                      ),
                    ),
                    SizedBox(width: 16), // مسافة بين الزرين
                    Expanded(
                      child: _buildButton(
                        icon: Icons.attach_money,
                        label: 'المصروفات',
                        onTap: () {
                          context.go('/ExpensesWizardPage');
        
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 140, // حجم أكبر
        decoration: BoxDecoration(
          color: Color(0xFF2196F3), // لون أزرق
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Colors.white),
            SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
