import 'package:flutter/material.dart';

enum OrderStatus {
  awaitingBoxDelivery,
  inTransit,
  washing,
  drying,
  readyForDelivery,
  outForCall
}

class OrderProgress {
  final String orderId;
  final OrderStatus status;

  OrderProgress({required this.orderId, required this.status});
}

class OrderProgressScreen extends StatelessWidget {
  final OrderProgress orderProgress;

  const OrderProgressScreen({super.key, required this.orderProgress});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> steps = [
      {
        'title': 'Awaiting Box Arrival',
        'icon': 'assets/images/fast-delivery.png'
      },
      {'title': 'Boxes in Transit', 'icon': 'assets/images/delivery-truck.png'},
      {'title': 'Clothes Washing', 'icon': 'assets/images/washing-clothes.png'},
      {'title': 'Clothes Drying', 'icon': 'assets/images/drying.png'},
      {'title': 'Ready for Delivery', 'icon': 'assets/images/clean.png'},
      {'title': 'Out for Call', 'icon': 'assets/images/package.png'},
    ];

    int currentStep = orderProgress.status.index;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Progress'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Track your order in real-time',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  bool isCompleted = index < currentStep;
                  bool isCurrent = index == currentStep;

                  return Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isCompleted
                                      ? Colors.green
                                      : isCurrent
                                          ? Colors.orange
                                          : Colors.grey[300],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    steps[index]['icon'],
                                    color: isCompleted
                                        ? Colors.white
                                        : isCurrent
                                            ? Colors.white
                                            : Colors.black54,
                                  ),
                                ),
                              ),
                              if (index != steps.length - 1)
                                Container(
                                  width: 3,
                                  height: 40,
                                  color: isCompleted
                                      ? Colors.green
                                      : Colors.grey[300],
                                ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Card(
                              elevation: isCurrent ? 4 : 1,
                              color:
                                  isCompleted ? Colors.green[50] : Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  steps[index]['title'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isCurrent
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: isCompleted
                                        ? Colors.green
                                        : isCurrent
                                            ? Colors.orange
                                            : Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
