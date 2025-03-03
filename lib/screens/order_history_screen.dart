import 'package:flutter/material.dart';

class Order {
  final String id;
  final String date;
  final String status;
  final double price;

  Order(
      {required this.id,
      required this.date,
      required this.status,
      required this.price});
}

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Order> orders = [
      Order(id: '001', date: 'Feb 20, 2024', status: 'Completed', price: 25.99),
      Order(id: '002', date: 'Feb 18, 2024', status: 'Pending', price: 14.50),
      Order(id: '003', date: 'Feb 15, 2024', status: 'Canceled', price: 30.75),
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return OrderCard(order: orders[index]);
        },
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(order.status);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: statusColor.withValues(alpha: 0.2),
          child: Icon(Icons.receipt_long, color: statusColor),
        ),
        title: Text('Order #${order.id}',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(order.date, style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 4),
            Text(order.status,
                style:
                    TextStyle(color: statusColor, fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: Text('\$${order.price.toStringAsFixed(2)}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        onTap: () {
          // TODO: Implement navigation to order details screen
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on Order #${order.id}')),
          );
        },
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Completed':
        return Colors.green;
      case 'Pending':
        return Colors.orange;
      case 'Canceled':
        return Colors.red;
      default:
        return Colors.blueGrey;
    }
  }
}
