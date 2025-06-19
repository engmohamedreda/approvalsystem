import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Notify extends StatelessWidget {
  final List<Map<String, String>> requests = const [
    {
      "status": "تم الرفض",
      "id": "REQ123",
      "name": "Ahmed Ali",
    },
    {
      "status": "تم القبول",
      "id": "REQ124",
      "name": "Mona Youssef",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.light;

    return Scaffold(
      appBar:AppBar(
        
        title: Text(
          'الاشعارات',
          style: TextStyle(
            color: isDark ? Colors.black : Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDark ? Colors.white : Colors.black,
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: requests.length,
          separatorBuilder: (_, __) => Divider(
            color: isDark ? Colors.grey.shade300 : Colors.grey.shade700,
          ),
          itemBuilder: (context, index) {
            final request = requests[index];
            final status = request["status"]!;
            final statusColor = status == "تم القبول"
                ? Colors.green
                : status == "تم الرفض"
                ? Colors.red
                : Colors.grey;
        
            return InkWell(
              onTap: () {
                context.go('/ExpenseRequestPage');
                print("تم الضغط على: ${request["id"]}");
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "ID: ${request["id"]}",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          request["name"]!,
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage:
                      AssetImage('assets/images/splachicon.jpg'),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
