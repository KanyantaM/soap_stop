import 'package:flutter/material.dart';

enum OrderStatus {
  awaitingBoxDelivery,
  inTransit,
  washing,
  drying,
  readyForDelivery,
  outForCall,
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
        'title': 'Awaiting Box Delivery',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Track your order in real-time',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
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
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color:
                                        isCurrent ? Colors.blue : Colors.black,
                                    width: 2,
                                  ),
                                  color: isCompleted || isCurrent
                                      ? Colors.white
                                      : Colors.grey[300],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    steps[index]['icon'],
                                    color: isCompleted || isCurrent
                                        ? null
                                        : Colors.black,
                                  ),
                                ),
                              ),
                              if (index != steps.length - 1)
                                Container(
                                  width: 2,
                                  height: 40,
                                  color: Colors.black,
                                ),
                            ],
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Card(
                              elevation: isCurrent ? 4 : 1,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: isCurrent
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  steps[index]['title'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: isCurrent
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
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
