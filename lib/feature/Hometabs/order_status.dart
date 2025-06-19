import 'package:flutter/material.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({super.key});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus> {
  bool showDetails = false;

  final List<Map<String, dynamic>> statuses = [
    {
      'status': 'REJECTED',
      'comment': 'Missing receipts',
      'color': Colors.red,
    },
    {
      'status': 'EDITED',
      'comment': 'Added missing receipts',
      'color': Colors.blue,
    },
    {
      'status': 'APPROVED',
      'comment': 'Receipts verified',
      'color': Colors.green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'حالة الطلب',
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDark ? Colors.black : Colors.white,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          label: Text('APPROVED', style: TextStyle(color: Colors.white)),
                          backgroundColor: Colors.blue,
                        ),
                        Text(
                          'EGP ١٣٥٠٠٠',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => setState(() => showDetails = !showDetails),
                      child: Text(
                        showDetails ? 'Show less' : 'Show approvals',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            if (showDetails) _buildTimeline()
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Container(
      color: Colors.white,
      child: Column(
        children: List.generate(statuses.length, (index) {
          final status = statuses[index];
          final isLast = index == statuses.length - 1;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 16,top:16,left: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Status: ${status['status']}',
                        style: TextStyle(
                          color: status['color'],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Comment: ${status['comment']}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Padding(
padding: EdgeInsets.only(top:16),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: status['color'],
                    ),
                    if (!isLast)
                      Container(
                        width: 2,
                        height: 60,
                        color: Colors.grey.shade400,
                      ),
                  ],
                ),
              ),



            ],
          );
        }),
      ),
    );
  }
}
